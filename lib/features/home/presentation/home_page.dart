import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../../../core/database/import/subway_line_info_importer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isImporting = false;
  String? _errorMessage;
  SubwayLineInfoImportResult? _importResult;
  _DatabaseDebugSnapshot? _snapshot;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshSnapshot();
    });
  }

  Future<void> _runLineInfoImport() async {
    setState(() {
      _isImporting = true;
      _errorMessage = null;
    });

    try {
      final importer = ref.read(subwayLineInfoImporterProvider);
      final result = await importer.importFromAsset();
      final snapshot = await _loadSnapshot();

      setState(() {
        _importResult = result;
        _snapshot = snapshot;
      });
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isImporting = false;
        });
      }
    }
  }

  Future<void> _refreshSnapshot() async {
    setState(() {
      _errorMessage = null;
    });

    try {
      final snapshot = await _loadSnapshot();
      if (mounted) {
        setState(() {
          _snapshot = snapshot;
        });
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          _errorMessage = error.toString();
        });
      }
    }
  }

  Future<_DatabaseDebugSnapshot> _loadSnapshot() async {
    final database = ref.read(appDatabaseProvider);
    final lines = await database.select(database.lines).get();
    final stations = await database.select(database.stations).get();
    final lineStations = await database.select(database.lineStations).get();
    final transfers = await database.select(database.transfers).get();
    final directionPolicies =
        await database.select(database.directionPolicies).get();

    return _DatabaseDebugSnapshot(
      lineCount: lines.length,
      stationCount: stations.length,
      lineStationCount: lineStations.length,
      transferCount: transfers.length,
      directionPolicyCount: directionPolicies.length,
      firstLineJson: lines.isEmpty ? null : _toPrettyJson(<String, Object?>{
        'id': lines.first.id,
        'name': lines.first.name,
        'color': lines.first.color,
        'lineType': lines.first.lineType,
        'operator': lines.first.operator,
      }),
      firstStationJson:
          stations.isEmpty ? null : _toPrettyJson(<String, Object?>{
            'id': stations.first.id,
            'nameKo': stations.first.nameKo,
            'nameEn': stations.first.nameEn,
            'nameJp': stations.first.nameJp,
            'nameCh': stations.first.nameCh,
          }),
    );
  }

  String _toPrettyJson(Map<String, Object?> json) {
    return const JsonEncoder.withIndent('  ').convert(json);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('서울 지하철 경로 안내'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            '디버그용 DB Import 화면',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'subway_line_info.json import를 실행하고 실제 DB row 수와 [0] 데이터를 확인할 수 있습니다.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF4B5563),
            ),
          ),
          const SizedBox(height: 24),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Import Actions',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton(
                      onPressed: _isImporting ? null : _runLineInfoImport,
                      child: Text(_isImporting ? 'Importing...' : 'Import Line Info'),
                    ),
                    OutlinedButton(
                      onPressed: _isImporting ? null : _refreshSnapshot,
                      child: const Text('Refresh Snapshot'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Assets: assets/data/subway_line_info.json, assets/data/subway_info_transfer.csv',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6B7280),
                  ),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    _errorMessage!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last Import Result',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                if (_importResult == null)
                  const Text('아직 import를 실행하지 않았습니다.')
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('processedRows: ${_importResult!.processedRows}'),
                      Text('insertedLines: ${_importResult!.insertedLines}'),
                      Text('insertedStations: ${_importResult!.insertedStations}'),
                      Text('updatedStations: ${_importResult!.updatedStations}'),
                      Text('skippedRows: ${_importResult!.skippedRows}'),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DB Snapshot',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                if (_snapshot == null)
                  const Text('DB snapshot을 불러오는 중입니다.')
                else ...[
                  Text('lines: ${_snapshot!.lineCount}'),
                  Text('stations: ${_snapshot!.stationCount}'),
                  Text('lineStations: ${_snapshot!.lineStationCount}'),
                  Text('transfers: ${_snapshot!.transferCount}'),
                  Text('directionPolicies: ${_snapshot!.directionPolicyCount}'),
                  const SizedBox(height: 16),
                  Text(
                    'lines[0]',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _JsonPreview(text: _snapshot!.firstLineJson),
                  const SizedBox(height: 16),
                  Text(
                    'stations[0]',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _JsonPreview(text: _snapshot!.firstStationJson),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DatabaseDebugSnapshot {
  const _DatabaseDebugSnapshot({
    required this.lineCount,
    required this.stationCount,
    required this.lineStationCount,
    required this.transferCount,
    required this.directionPolicyCount,
    required this.firstLineJson,
    required this.firstStationJson,
  });

  final int lineCount;
  final int stationCount;
  final int lineStationCount;
  final int transferCount;
  final int directionPolicyCount;
  final String? firstLineJson;
  final String? firstStationJson;
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

class _JsonPreview extends StatelessWidget {
  const _JsonPreview({required this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const Text('데이터 없음');
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SelectableText(
        text!,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}
