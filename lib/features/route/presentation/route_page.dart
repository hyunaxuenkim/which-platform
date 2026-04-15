import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/database/database_provider.dart';
import '../../route_parser/domain/parsed_route_models.dart';
import '../../route_parser/domain/route_api_response_dto.dart';
import '../../route_parser/domain/route_response_parser.dart';
import '../../route_parser/domain/route_view_data.dart';
import '../../route_parser/domain/route_view_data_mapper.dart';
import '../../route_parser/providers/route_parser_providers.dart';
import '../../search/domain/station_search_lookup.dart';
import '../../search/providers/station_search_lookup_provider.dart';
import '../../search/presentation/search_route_params.dart';
import '../../settings/domain/app_language.dart';
import '../../settings/domain/app_strings.dart';
import '../../settings/providers/app_language_providers.dart';
import '../../settings/presentation/app_settings_sheet.dart';

class RoutePage extends ConsumerStatefulWidget {
  const RoutePage({super.key, this.params});

  final SearchRouteParams? params;

  @override
  ConsumerState<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends ConsumerState<RoutePage> {
  final RouteResponseParser _routeResponseParser = const RouteResponseParser();
  late Future<_RouteScreenState> _screenStateFuture;

  Future<void> _openSettings() async {
    await showAppSettingsSheet(
      context,
      initialLanguage: ref.read(appLanguageProvider),
    );
  }

  @override
  void initState() {
    super.initState();
    _screenStateFuture = _loadRouteScreenState();
  }

  Future<_RouteScreenState> _loadRouteScreenState() async {
    final SearchRouteParams? params = widget.params;
    if (params == null) {
      return const _RouteScreenState.error(
        error: _RouteErrorData.noRouteData(),
      );
    }

    final String origin = params.origin.trim();
    final String destination = params.destination.trim();
    if (origin.isEmpty || destination.isEmpty) {
      return _RouteScreenState.error(
        error: _RouteErrorData.stationsRequired(
          missingOrigin: origin.isEmpty,
          missingDestination: destination.isEmpty,
        ),
      );
    }

    try {
      await _ensureDatabaseSeeded();
      final database = ref.read(appDatabaseProvider);
      final _NormalizedStations normalizedStations =
          await _normalizeStationsForRequest(
            origin: origin,
            destination: destination,
          );

      final DateTime requestDateTime = _buildTodayNoon();
      final RouteApiResponseDto response = await ref
          .read(seoulRouteApiClientProvider)
          .fetchShortestPath(
            departureStation: normalizedStations.origin,
            arrivalStation: normalizedStations.destination,
            requestDateTime: requestDateTime,
          );

      final String? resultCode = response.header?.resultCode;
      if (resultCode != null && resultCode != '00') {
        return _RouteScreenState.error(
          error: _RouteErrorData.routeUnavailable(
            resultCode: resultCode,
            resultMessage: response.header?.resultMsg ?? 'Unknown error',
          ),
        );
      }

      final ParsedRouteParseResult parseResult = await _routeResponseParser
          .parseWithDatabase(response, database: database);
      final Map<String, String> lineColorHexByName = await database
          .getLineColorHexByName();
      final RouteViewDataMapperContext mapperContext =
          await RouteViewDataMapperContext.load(database);

      return await parseResult.when(
        success: (ParsedRoute route) async {
          return _RouteScreenState.success(
            params: params,
            parsedRoute: route,
            lineColorHexByName: lineColorHexByName,
            mapperContext: mapperContext,
            requestDateTime: requestDateTime,
          );
        },
        failure: (ParseFailureCode code, String? message) async {
          return _RouteScreenState.error(
            error: _RouteErrorData.buildFailure(
              failureCode: code.name,
              detail: message,
            ),
          );
        },
      );
    } catch (error) {
      return _RouteScreenState.error(
        error: _RouteErrorData.loadFailure(detail: error.toString()),
      );
    }
  }

  Future<_NormalizedStations> _normalizeStationsForRequest({
    required String origin,
    required String destination,
  }) async {
    final StationSearchLookup lookup = await ref.read(
      stationSearchLookupProvider.future,
    );
    final AppLanguage language = ref.read(appLanguageProvider);
    return _NormalizedStations(
      origin: lookup.normalizeToCanonicalKorean(
        origin,
        preferredLanguage: language,
      ),
      destination: lookup.normalizeToCanonicalKorean(
        destination,
        preferredLanguage: language,
      ),
    );
  }

  Future<void> _ensureDatabaseSeeded() async {
    final database = ref.read(appDatabaseProvider);
    final bool hasLines =
        (await database.select(database.lines).get()).isNotEmpty;
    final bool hasLineStations =
        (await database.select(database.lineStations).get()).isNotEmpty;
    final bool hasDirectionPolicies =
        (await database.select(database.directionPolicies).get()).isNotEmpty;
    final bool hasStationTransitionOverrides =
        (await database.select(database.stationTransitionOverrides).get())
            .isNotEmpty;

    if (hasLines &&
        hasLineStations &&
        hasDirectionPolicies &&
        hasStationTransitionOverrides) {
      return;
    }

    final importer = ref.read(subwayLineInfoImporterProvider);
    await importer.importFromAsset();
    ref.invalidate(stationSearchLookupProvider);
  }

  DateTime _buildTodayNoon() {
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 12);
  }

  Future<void> _retry() async {
    setState(() {
      _screenStateFuture = _loadRouteScreenState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder<_RouteScreenState>(
              future: _screenStateFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const _RouteLoadingState();
                }

                final _RouteScreenState? screenState = snapshot.data;
                if (screenState == null ||
                    screenState.mode == _RouteMode.error) {
                  return _RouteErrorState(
                    error:
                        screenState?.error ??
                        const _RouteErrorData.loadFailure(),
                    onRetry: _retry,
                  );
                }

                return _RouteSuccessContent(
                  parsedRoute: screenState.parsedRoute!,
                  lineColorHexByName: screenState.lineColorHexByName!,
                  mapperContext: screenState.mapperContext!,
                  requestDateTime: screenState.requestDateTime!,
                  onRetry: _retry,
                  onOpenSettings: _openSettings,
                );
              },
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: _BottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class _NormalizedStations {
  const _NormalizedStations({required this.origin, required this.destination});

  final String origin;
  final String destination;
}

enum _RouteMode { success, error }

enum _RouteErrorKind {
  noRouteData,
  stationsRequired,
  routeUnavailable,
  buildFailure,
  loadFailure,
}

class _RouteErrorData {
  const _RouteErrorData._({
    required this.kind,
    this.missingOrigin = false,
    this.missingDestination = false,
    this.resultCode,
    this.resultMessage,
    this.failureCode,
    this.detail,
  });

  const _RouteErrorData.noRouteData()
    : this._(kind: _RouteErrorKind.noRouteData);

  const _RouteErrorData.stationsRequired({
    required bool missingOrigin,
    required bool missingDestination,
  }) : this._(
         kind: _RouteErrorKind.stationsRequired,
         missingOrigin: missingOrigin,
         missingDestination: missingDestination,
       );

  const _RouteErrorData.routeUnavailable({
    required String resultCode,
    required String resultMessage,
  }) : this._(
         kind: _RouteErrorKind.routeUnavailable,
         resultCode: resultCode,
         resultMessage: resultMessage,
       );

  const _RouteErrorData.buildFailure({
    required String failureCode,
    String? detail,
  }) : this._(
         kind: _RouteErrorKind.buildFailure,
         failureCode: failureCode,
         detail: detail,
       );

  const _RouteErrorData.loadFailure({String? detail})
    : this._(kind: _RouteErrorKind.loadFailure, detail: detail);

  final _RouteErrorKind kind;
  final bool missingOrigin;
  final bool missingDestination;
  final String? resultCode;
  final String? resultMessage;
  final String? failureCode;
  final String? detail;

  String title(AppStrings strings) {
    switch (kind) {
      case _RouteErrorKind.noRouteData:
        return strings.routeErrorNoDataTitle;
      case _RouteErrorKind.stationsRequired:
        return strings.routeErrorStationsRequiredTitle;
      case _RouteErrorKind.routeUnavailable:
        return strings.routeErrorUnavailableTitle;
      case _RouteErrorKind.buildFailure:
        return strings.routeErrorBuildTitle;
      case _RouteErrorKind.loadFailure:
        return strings.routeErrorLoadTitle;
    }
  }

  String message(AppStrings strings) {
    switch (kind) {
      case _RouteErrorKind.noRouteData:
        return strings.routeErrorNoDataMessage;
      case _RouteErrorKind.stationsRequired:
        if (missingOrigin && missingDestination) {
          return strings.routeErrorBothStationsMissingMessage;
        }
        if (missingOrigin) {
          return strings.routeErrorOriginMissingMessage;
        }
        return strings.routeErrorDestinationMissingMessage;
      case _RouteErrorKind.routeUnavailable:
        final String? code = resultCode;
        final String? message = resultMessage;
        if (code == null || message == null) {
          return strings.routeErrorUnavailableMessage;
        }
        return strings.routeUnavailableMessage(code, message);
      case _RouteErrorKind.buildFailure:
        return strings.routeBuildFailureMessage(
          failureCode ?? 'unknown',
          detail: detail,
        );
      case _RouteErrorKind.loadFailure:
        if (detail == null || detail!.trim().isEmpty) {
          return strings.routeErrorUnexpectedMessage;
        }
        return detail!;
    }
  }
}

class _RouteScreenState {
  const _RouteScreenState.success({
    required this.params,
    required this.parsedRoute,
    required this.lineColorHexByName,
    required this.mapperContext,
    required this.requestDateTime,
  }) : mode = _RouteMode.success,
       error = null;

  const _RouteScreenState.error({required this.error})
    : mode = _RouteMode.error,
      params = null,
      parsedRoute = null,
      lineColorHexByName = null,
      mapperContext = null,
      requestDateTime = null,
      assert(error != null);

  final _RouteMode mode;
  final SearchRouteParams? params;
  final ParsedRoute? parsedRoute;
  final Map<String, String>? lineColorHexByName;
  final RouteViewDataMapperContext? mapperContext;
  final DateTime? requestDateTime;
  final _RouteErrorData? error;
}

class _RouteSuccessContent extends ConsumerWidget {
  const _RouteSuccessContent({
    required this.parsedRoute,
    required this.lineColorHexByName,
    required this.mapperContext,
    required this.requestDateTime,
    required this.onRetry,
    required this.onOpenSettings,
  });

  final ParsedRoute parsedRoute;
  final Map<String, String> lineColorHexByName;
  final RouteViewDataMapperContext mapperContext;
  final DateTime requestDateTime;
  final Future<void> Function() onRetry;
  final Future<void> Function() onOpenSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(appStringsProvider);
    final appLanguage = ref.watch(appLanguageProvider);
    final RouteViewData routeViewData = RouteViewDataMapper(
      lineColorHexByName: lineColorHexByName,
    ).map(parsedRoute, language: appLanguage, databaseContext: mapperContext);
    final List<Widget> content = <Widget>[
      _RouteTopBar(
        brand: strings.brand,
        onBackPressed: () => context.pop(),
        onSettingsPressed: () => onOpenSettings(),
      ),
      const SizedBox(height: 20),
      _RouteSummaryCard(summary: routeViewData.summary, strings: strings),
    ];

    for (int index = 0; index < routeViewData.legItems.length; index++) {
      final RouteLegItemViewData leg = routeViewData.legItems[index];
      final RouteTransferItemViewData? transfer =
          index < routeViewData.transferItems.length
          ? routeViewData.transferItems[index]
          : null;
      content.add(const SizedBox(height: 20));
      content.add(_RouteLegCard(leg: leg, legIndex: index, strings: strings));
      if (transfer != null) {
        content.add(const SizedBox(height: 12));
        content.add(
          _RouteTransferCard(
            transfer: transfer,
            fromColorHex: leg.lineColorHex,
            strings: strings,
          ),
        );
      }
    }

    content.add(const SizedBox(height: 24));
    content.add(
      _RouteActionsCard(
        onRetry: onRetry,
        requestedAt: requestDateTime,
        strings: strings,
      ),
    );
    content.add(const SizedBox(height: 116));

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content,
            ),
          ),
        ),
      ),
    );
  }
}

class _RouteTopBar extends StatelessWidget {
  const _RouteTopBar({
    required this.brand,
    required this.onBackPressed,
    required this.onSettingsPressed,
  });

  final String brand;
  final VoidCallback onBackPressed;
  final VoidCallback onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onBackPressed,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF2C2F30),
          ),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.directions_subway_rounded, color: Color(0xFF0049E6)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            brand,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -1.2,
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: onSettingsPressed,
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFFEFF1F2),
            foregroundColor: const Color(0xFF595C5D),
          ),
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}

class _RouteSummaryCard extends StatelessWidget {
  const _RouteSummaryCard({required this.summary, required this.strings});

  final RouteSummaryViewData summary;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0049E6), Color(0xFF829BFF)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A002866),
            blurRadius: 28,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.displayLabel(strings.routeEyebrow),
              style: theme.textTheme.labelSmall?.copyWith(
                color: const Color(0xCCF2F1FF),
                fontWeight: FontWeight.w800,
                letterSpacing: 2.8,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              strings.routeSummaryHeadline(
                summary.departureStation.fullText,
                summary.arrivalStation.fullText,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: const Color(0xFFF2F1FF),
                fontWeight: FontWeight.w900,
                letterSpacing: -1.4,
                height: 1.05,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              strings.routeSummaryDescription(
                summary.departureStation.fullText,
                summary.arrivalStation.fullText,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: const Color(0xD9F2F1FF),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 18),
            Container(height: 1, color: const Color(0x33FFFFFF)),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: _SummaryMetric(
                    label: strings.displayLabel(strings.routeTravelTimeLabel),
                    value: strings.displayLabel(
                      strings.formatDuration(summary.totalDurationSeconds),
                    ),
                    valueFontSize: 36,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _SummaryBadge(
                        icon: Icons.swap_horiz_rounded,
                        text: strings.displayLabel(
                          strings.formatTransferCount(summary.transferCount),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _SummaryBadge(
                        icon: Icons.payments_outlined,
                        text: strings.displayLabel(
                          strings.formatFare(summary.totalFare),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryMetric extends StatelessWidget {
  const _SummaryMetric({
    required this.label,
    required this.value,
    required this.valueFontSize,
  });

  final String label;
  final String value;
  final double valueFontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: const Color(0xCCF2F1FF),
            fontWeight: FontWeight.w800,
            letterSpacing: 2.1,
          ),
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            maxLines: 1,
            style: theme.textTheme.displayMedium?.copyWith(
              color: const Color(0xFFF2F1FF),
              fontWeight: FontWeight.w900,
              fontSize: valueFontSize,
              letterSpacing: -2.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _SummaryBadge extends StatelessWidget {
  const _SummaryBadge({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(icon, size: 16, color: const Color(0xFFF2F1FF)),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: const Color(0xFFF2F1FF),
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _RouteLegCard extends StatelessWidget {
  const _RouteLegCard({
    required this.leg,
    required this.legIndex,
    required this.strings,
  });

  final RouteLegItemViewData leg;
  final int legIndex;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    final Color lineColor = _parseHexColor(leg.lineColorHex);
    final String lineToken = _lineToken(leg.lineName);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 8,
              decoration: BoxDecoration(
                color: lineColor,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(28),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: lineColor,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        lineToken,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        leg.lineName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ),
                    Text(
                      strings.displayLabel(
                        strings.formatDuration(leg.durationSeconds),
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF5C5B5B),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                _LegTimelineSection(
                  leg: leg,
                  lineColor: lineColor,
                  strings: strings,
                ),
                const SizedBox(height: 18),
                _PlatformDecisionCard(
                  title: strings.displayLabel(
                    strings.routeCorrectPlatformTitle,
                  ),
                  accentColor: const Color(0xFF0049E6),
                  titleColor: Colors.white,
                  bodyColor: const Color(0x140049E6),
                  heading: strings.routeTowardsLabel,
                  mainText: strings.displayLabel(
                    leg.directionPositiveExamplesText,
                  ),
                  supportingLabel: strings.routeNextStationLabel,
                  supportingText: strings.displayLabel(
                    leg.nextStation.fullText,
                  ),
                  trailingIcon: Icons.check_circle,
                  trailingColor: const Color(0xFF0049E6),
                ),
                const SizedBox(height: 12),
                _PlatformDecisionCard(
                  title: strings.displayLabel(strings.routeWrongPlatformTitle),
                  accentColor: const Color(0x1FB31B25),
                  titleColor: const Color(0xFFB31B25),
                  bodyColor: const Color(0x0DFB5151),
                  heading: strings.routeTowardsLabel,
                  mainText: strings.displayLabel(
                    leg.directionNegativeExamplesText,
                  ),
                  supportingLabel: strings.routePreviousStationLabel,
                  supportingText: strings.displayLabel(
                    leg.nextNegativeStation.fullText,
                  ),
                  trailingIcon: Icons.cancel,
                  trailingColor: const Color(0x66B31B25),
                  borderColor: const Color(0x4DB31B25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _lineToken(String lineName) {
    final RegExp digitPattern = RegExp(r'\d+');
    final Match? digitMatch = digitPattern.firstMatch(lineName);
    if (digitMatch != null) {
      return digitMatch.group(0)!;
    }

    final List<String> words = lineName.trim().split(RegExp(r'\s+'));
    if (words.isEmpty || words.first.isEmpty) {
      return '?';
    }
    return words.first.substring(0, 1).toUpperCase();
  }
}

class _LegTimelineSection extends StatefulWidget {
  const _LegTimelineSection({
    required this.leg,
    required this.lineColor,
    required this.strings,
  });

  final RouteLegItemViewData leg;
  final Color lineColor;
  final AppStrings strings;

  @override
  State<_LegTimelineSection> createState() => _LegTimelineSectionState();
}

class _LegTimelineSectionState extends State<_LegTimelineSection> {
  bool _isTrailExpanded = false;

  @override
  void didUpdateWidget(covariant _LegTimelineSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.leg != widget.leg) {
      _isTrailExpanded = false;
    }
  }

  List<StationDisplayNameViewData> get _intermediateStations {
    final List<StationDisplayNameViewData> stations = widget.leg.stations;
    if (stations.length <= 2) {
      return const <StationDisplayNameViewData>[];
    }
    return stations.sublist(1, stations.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    final List<StationDisplayNameViewData> intermediateStations =
        _intermediateStations;

    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Column(
        children: [
          _TimelineRow(
            filled: false,
            lineColor: widget.lineColor,
            label: widget.strings.displayLabel(widget.strings.routeFromLabel),
            station: widget.leg.fromStation,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 2,
                  height: 34,
                  color: widget.lineColor.withValues(alpha: 0.2),
                ),
                const SizedBox(width: 18),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (intermediateStations.isNotEmpty)
                      _TrailToggleButton(
                        text: widget.strings.displayLabel(
                          widget.strings.formatStationCount(
                            widget.leg.stationCount,
                          ),
                        ),
                        lineColor: widget.lineColor,
                        expanded: _isTrailExpanded,
                        onPressed: () {
                          setState(() {
                            _isTrailExpanded = !_isTrailExpanded;
                          });
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (intermediateStations.isNotEmpty)
            AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              child: _isTrailExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _ExpandedStationTrail(
                        stations: intermediateStations,
                        lineColor: widget.lineColor,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          const SizedBox(height: 12),
          _TimelineRow(
            filled: true,
            lineColor: widget.lineColor,
            label: widget.strings.displayLabel(widget.strings.routeToLabel),
            station: widget.leg.toStation,
          ),
        ],
      ),
    );
  }
}

class _TrailToggleButton extends StatelessWidget {
  const _TrailToggleButton({
    required this.text,
    required this.lineColor,
    required this.expanded,
    required this.onPressed,
  });

  final String text;
  final Color lineColor;
  final bool expanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: expanded ? lineColor : const Color(0xFFEAF1FF),
        foregroundColor: expanded ? Colors.white : const Color(0xFF0049E6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
          side: BorderSide(
            color: expanded ? lineColor : const Color(0xFFB9CDFB),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(width: 4),
          Icon(
            expanded
                ? Icons.keyboard_arrow_up_rounded
                : Icons.keyboard_arrow_down_rounded,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _ExpandedStationTrail extends StatelessWidget {
  const _ExpandedStationTrail({
    required this.stations,
    required this.lineColor,
  });

  final List<StationDisplayNameViewData> stations;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(stations.length, (index) {
        return _IntermediateStationRow(
          station: stations[index],
          lineColor: lineColor,
          isFirst: index == 0,
          isLast: index == stations.length - 1,
        );
      }),
    );
  }
}

class _IntermediateStationRow extends StatelessWidget {
  const _IntermediateStationRow({
    required this.station,
    required this.lineColor,
    required this.isFirst,
    required this.isLast,
  });

  final StationDisplayNameViewData station;
  final Color lineColor;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final Color spineColor = lineColor.withValues(alpha: 0.28);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 12,
            child: Column(
              children: [
                Container(
                  width: 2,
                  height: isFirst ? 10 : 14,
                  color: spineColor,
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: lineColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 2,
                  height: isLast ? 10 : 22,
                  color: spineColor,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: _StationDisplayText(
                station: station,
                primaryStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF2C2F30),
                  fontWeight: FontWeight.w700,
                ),
                secondaryStyle: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(
                      color: const Color(0xFF6A6D6E),
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({
    required this.filled,
    required this.lineColor,
    required this.label,
    required this.station,
  });

  final bool filled;
  final Color lineColor;
  final String label;
  final StationDisplayNameViewData station;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: filled ? lineColor : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: lineColor, width: 2),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: const Color(0xFF5C5B5B),
            fontWeight: FontWeight.w800,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StationDisplayText(
            station: station,
            primaryStyle: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
            secondaryStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF5C5B5B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _PlatformDecisionCard extends StatelessWidget {
  const _PlatformDecisionCard({
    required this.title,
    required this.accentColor,
    required this.titleColor,
    required this.bodyColor,
    required this.heading,
    required this.mainText,
    required this.supportingLabel,
    required this.supportingText,
    required this.trailingIcon,
    required this.trailingColor,
    this.borderColor,
  });

  final String title;
  final Color accentColor;
  final Color titleColor;
  final Color bodyColor;
  final String heading;
  final String mainText;
  final String supportingLabel;
  final String supportingText;
  final IconData trailingIcon;
  final Color trailingColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bodyColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: borderColor ?? accentColor, width: 2),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: titleColor,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: const Color(0xFF5C5B5B),
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.7,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mainText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        supportingLabel,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: const Color(0x99595C5D),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.6,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        supportingText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1.2,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Icon(trailingIcon, size: 40, color: trailingColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RouteTransferCard extends StatelessWidget {
  const _RouteTransferCard({
    required this.transfer,
    required this.fromColorHex,
    required this.strings,
  });

  final RouteTransferItemViewData transfer;
  final String fromColorHex;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    final Color fromColor = _parseHexColor(fromColorHex);
    final Color toColor = _parseHexColor(transfer.toLineColorHex);

    return Stack(
      children: [
        Positioned(
          left: 24,
          top: 0,
          bottom: 0,
          child: Container(
            width: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [fromColor, toColor],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 36),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 14,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0x14FE9CF4),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: const Icon(
                    Icons.transfer_within_a_station_rounded,
                    color: Color(0xFF8E3A8A),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        strings.displayLabel(
                          strings.routeTransferTitle(transfer.station.fullText),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: const Color(0xFF8E3A8A),
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _MiniLineBadge(
                            text: _miniToken(transfer.fromLineName),
                            color: fromColor,
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: Color(0xFF5C5B5B),
                          ),
                          const SizedBox(width: 6),
                          _MiniLineBadge(
                            text: _miniToken(transfer.toLineName),
                            color: toColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      strings.displayLabel(
                        strings.formatDuration(transfer.walkingTimeSeconds),
                      ),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _miniToken(String lineName) {
    final RegExp digitPattern = RegExp(r'\d+');
    final Match? digitMatch = digitPattern.firstMatch(lineName);
    if (digitMatch != null) {
      return digitMatch.group(0)!;
    }
    final String trimmed = lineName.trim();
    if (trimmed.isEmpty) {
      return '?';
    }
    return trimmed.substring(0, 1).toUpperCase();
  }
}

class _MiniLineBadge extends StatelessWidget {
  const _MiniLineBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _StationDisplayText extends StatelessWidget {
  const _StationDisplayText({
    required this.station,
    required this.primaryStyle,
    this.secondaryStyle,
  });

  final StationDisplayNameViewData station;
  final TextStyle? primaryStyle;
  final TextStyle? secondaryStyle;

  @override
  Widget build(BuildContext context) {
    final String? secondary = station.secondary?.trim();
    if (secondary == null || secondary.isEmpty) {
      return Text(
        station.primary,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: primaryStyle,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          station.primary,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: primaryStyle,
        ),
        const SizedBox(height: 2),
        Text(
          secondary,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: secondaryStyle,
        ),
      ],
    );
  }
}

class _RouteActionsCard extends StatelessWidget {
  const _RouteActionsCard({
    required this.onRetry,
    required this.requestedAt,
    required this.strings,
  });

  final Future<void> Function() onRetry;
  final DateTime requestedAt;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF1F2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.displayLabel(strings.routeNextActionTitle),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: const Color(0xFF5C5B5B),
              fontWeight: FontWeight.w900,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            strings.routeNextActionDescription,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            strings.routeRequestTimeText(requestedAt),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF595C5D)),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: () => context.pop(),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF0049E6),
                  foregroundColor: const Color(0xFFF2F1FF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                ),
                icon: const Icon(Icons.search_rounded),
                label: Text(strings.routeSearchAgain),
              ),
              OutlinedButton.icon(
                onPressed: () => onRetry(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF2C2F30),
                  side: const BorderSide(color: Color(0x33ABADAE)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                ),
                icon: const Icon(Icons.refresh_rounded),
                label: Text(strings.routeRefreshRoute),
              ),
              OutlinedButton.icon(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  disabledForegroundColor: const Color(0xFF8B8E90),
                  disabledBackgroundColor: const Color(0x11FFFFFF),
                  side: const BorderSide(color: Color(0x22ABADAE)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                ),
                icon: const Icon(Icons.translate_rounded),
                label: Text(strings.routeActionLanguage),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RouteLoadingState extends ConsumerWidget {
  const _RouteLoadingState();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(appStringsProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 36,
              height: 36,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
            const SizedBox(height: 20),
            Text(
              strings.routeLoadingTitle,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              strings.routeLoadingDescription,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: const Color(0xFF595C5D)),
            ),
          ],
        ),
      ),
    );
  }
}

class _RouteErrorState extends ConsumerWidget {
  const _RouteErrorState({required this.error, required this.onRetry});

  final _RouteErrorData error;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(appStringsProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0x14FB5151),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.error_outline_rounded,
                    color: Color(0xFFB31B25),
                    size: 28,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  error.title(strings),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  error.message(strings),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF595C5D),
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: () => onRetry(),
                      icon: const Icon(Icons.refresh_rounded),
                      label: Text(strings.routeRetry),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: Text(strings.routeBack),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(appStringsProvider);

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
      decoration: const BoxDecoration(
        color: Color(0xCCFFFFFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 24,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.explore_rounded,
              label: strings.navNavigate,
              selected: true,
            ),
            _NavItem(
              icon: Icons.bookmark_border_rounded,
              label: strings.navSaved,
            ),
            _NavItem(icon: Icons.history_rounded, label: strings.navHistory),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = selected
        ? Colors.white
        : const Color(0xFF757778);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF0049E6) : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: foregroundColor),
            const SizedBox(height: 2),
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.w700,
                fontSize: 10,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color _parseHexColor(String value) {
  final String normalized = value.replaceFirst('#', '');
  final String hex = normalized.length == 6 ? 'FF$normalized' : normalized;
  return Color(int.parse(hex, radix: 16));
}
