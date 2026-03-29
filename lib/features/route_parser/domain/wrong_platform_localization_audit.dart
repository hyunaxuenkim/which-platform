import '../../settings/domain/app_language.dart';
import 'parsed_route_models.dart';
import 'route_view_data.dart';
import 'route_view_data_mapper.dart';

enum WrongPlatformLocalizationIssue {
  none,
  missing,
  koreanRaw,
  hardcodedEnglish,
}

class WrongPlatformFieldAudit {
  const WrongPlatformFieldAudit({
    required this.fieldName,
    required this.source,
    required this.value,
    required this.issue,
  });

  final String fieldName;
  final String source;
  final String value;
  final WrongPlatformLocalizationIssue issue;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'fieldName': fieldName,
      'source': source,
      'value': value,
      'issue': issue.name,
    };
  }
}

class WrongPlatformLegLocalizationAudit {
  const WrongPlatformLegLocalizationAudit({
    required this.lineName,
    required this.language,
    required this.fields,
  });

  final String lineName;
  final AppLanguage language;
  final List<WrongPlatformFieldAudit> fields;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'lineName': lineName,
      'language': language.name,
      'fields': fields.map((WrongPlatformFieldAudit field) => field.toJson()).toList(
        growable: false,
      ),
    };
  }
}

class WrongPlatformLocalizationAuditor {
  const WrongPlatformLocalizationAuditor();

  List<WrongPlatformLegLocalizationAudit> auditRoute({
    required ParsedRoute route,
    required RouteViewData viewData,
    required AppLanguage language,
  }) {
    final int legCount = route.legs.length < viewData.legItems.length
        ? route.legs.length
        : viewData.legItems.length;

    return List<WrongPlatformLegLocalizationAudit>.generate(legCount, (int index) {
      final RouteLeg leg = route.legs[index];
      final RouteLegItemViewData item = viewData.legItems[index];
      return auditLeg(
        leg: leg,
        item: item,
        language: language,
      );
    }, growable: false);
  }

  WrongPlatformLegLocalizationAudit auditLeg({
    required RouteLeg leg,
    required RouteLegItemViewData item,
    required AppLanguage language,
  }) {
    return WrongPlatformLegLocalizationAudit(
      lineName: item.lineName,
      language: language,
      fields: <WrongPlatformFieldAudit>[
        WrongPlatformFieldAudit(
          fieldName: 'directionLabel',
          source: 'RouteResponseParser.directionLabel',
          value: item.directionLabel,
          issue: _classifyValue(item.directionLabel, language: language),
        ),
        WrongPlatformFieldAudit(
          fieldName: 'negativeExamples',
          source:
              'RouteViewDataMapper.resolveDirectionNegativeExamplesText -> direction_policies.displayLabelKo',
          value: item.directionNegativeExamplesText,
          issue: _classifyValue(
            item.directionNegativeExamplesText,
            language: language,
          ),
        ),
        WrongPlatformFieldAudit(
          fieldName: 'previousStation',
          source:
              'RouteViewDataMapper._resolveNextNegativeStation -> StationDisplayNameResolver',
          value: item.nextNegativeStation.fullText,
          issue: _classifyValue(
            item.nextNegativeStation.fullText,
            language: language,
          ),
        ),
        WrongPlatformFieldAudit(
          fieldName: 'lineName',
          source: 'ParsedRoute.lineName -> RouteViewDataMapper.lineName',
          value: leg.lineName,
          issue: _classifyValue(leg.lineName, language: language),
        ),
      ],
    );
  }

  WrongPlatformLocalizationIssue _classifyValue(
    String value, {
    required AppLanguage language,
  }) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty || trimmed == RouteViewDataMapper.missingInformationText) {
      return WrongPlatformLocalizationIssue.missing;
    }
    if (_containsHangul(trimmed)) {
      return WrongPlatformLocalizationIssue.koreanRaw;
    }
    return WrongPlatformLocalizationIssue.none;
  }

  bool _containsHangul(String value) {
    return RegExp(r'[\u1100-\u11FF\u3130-\u318F\uAC00-\uD7AF]').hasMatch(value);
  }
}
