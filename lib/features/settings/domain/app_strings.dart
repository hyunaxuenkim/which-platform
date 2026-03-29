import 'app_language.dart';
import 'app_language_extensions.dart';

class AppStrings {
  const AppStrings({
    required this.language,
    required this.brand,
    required this.searchHeading,
    required this.searchSubheading,
    required this.searchDefaultOrigin,
    required this.searchOriginHint,
    required this.searchDestinationHint,
    required this.searchGoCta,
    required this.navNavigate,
    required this.navSaved,
    required this.navHistory,
    required this.settingsTitle,
    required this.settingsSectionGeneral,
    required this.settingsLanguageLabel,
    required this.settingsLanguageDescription,
    required this.settingsLanguageOptionEn,
    required this.settingsLanguageOptionZhHans,
    required this.settingsLanguageOptionJa,
    required this.settingsClose,
    required this.routeActionLanguage,
    required this.routeEyebrow,
    required this.routeTravelTimeLabel,
    required this.routeCorrectPlatformTitle,
    required this.routeWrongPlatformTitle,
    required this.routeTowardsLabel,
    required this.routeNextStationLabel,
    required this.routePreviousStationLabel,
    required this.routeFromLabel,
    required this.routeToLabel,
    required this.routeNextActionTitle,
    required this.routeNextActionDescription,
    required this.routeRequestTimeLabel,
    required this.routeSearchAgain,
    required this.routeRefreshRoute,
    required this.routeLoadingTitle,
    required this.routeLoadingDescription,
    required this.routeRetry,
    required this.routeBack,
    required this.routeErrorNoDataTitle,
    required this.routeErrorNoDataMessage,
    required this.routeErrorStationsRequiredTitle,
    required this.routeErrorBothStationsMissingMessage,
    required this.routeErrorOriginMissingMessage,
    required this.routeErrorDestinationMissingMessage,
    required this.routeErrorUnavailableTitle,
    required this.routeErrorUnavailableMessage,
    required this.routeErrorBuildTitle,
    required this.routeErrorBuildMessage,
    required this.routeErrorLoadTitle,
    required this.routeErrorUnexpectedMessage,
  });

  final AppLanguage language;
  final String brand;
  final String searchHeading;
  final String searchSubheading;
  final String searchDefaultOrigin;
  final String searchOriginHint;
  final String searchDestinationHint;
  final String searchGoCta;
  final String navNavigate;
  final String navSaved;
  final String navHistory;
  final String settingsTitle;
  final String settingsSectionGeneral;
  final String settingsLanguageLabel;
  final String settingsLanguageDescription;
  final String settingsLanguageOptionEn;
  final String settingsLanguageOptionZhHans;
  final String settingsLanguageOptionJa;
  final String settingsClose;
  final String routeActionLanguage;
  final String routeEyebrow;
  final String routeTravelTimeLabel;
  final String routeCorrectPlatformTitle;
  final String routeWrongPlatformTitle;
  final String routeTowardsLabel;
  final String routeNextStationLabel;
  final String routePreviousStationLabel;
  final String routeFromLabel;
  final String routeToLabel;
  final String routeNextActionTitle;
  final String routeNextActionDescription;
  final String routeRequestTimeLabel;
  final String routeSearchAgain;
  final String routeRefreshRoute;
  final String routeLoadingTitle;
  final String routeLoadingDescription;
  final String routeRetry;
  final String routeBack;
  final String routeErrorNoDataTitle;
  final String routeErrorNoDataMessage;
  final String routeErrorStationsRequiredTitle;
  final String routeErrorBothStationsMissingMessage;
  final String routeErrorOriginMissingMessage;
  final String routeErrorDestinationMissingMessage;
  final String routeErrorUnavailableTitle;
  final String routeErrorUnavailableMessage;
  final String routeErrorBuildTitle;
  final String routeErrorBuildMessage;
  final String routeErrorLoadTitle;
  final String routeErrorUnexpectedMessage;

  bool get _usesWideCaps => !language.isCjk;

  String displayLabel(String value) {
    return _usesWideCaps ? value.toUpperCase() : value;
  }

  String formatDuration(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainSeconds = seconds % 60;

    switch (language) {
      case AppLanguage.en:
        if (minutes == 0) {
          return '${remainSeconds}s';
        }
        if (remainSeconds == 0) {
          return '${minutes}m';
        }
        return '${minutes}m ${remainSeconds}s';
      case AppLanguage.zhHans:
        if (minutes == 0) {
          return '$remainSeconds秒';
        }
        if (remainSeconds == 0) {
          return '$minutes分';
        }
        return '$minutes分$remainSeconds秒';
      case AppLanguage.ja:
        if (minutes == 0) {
          return '$remainSeconds秒';
        }
        if (remainSeconds == 0) {
          return '$minutes分';
        }
        return '$minutes分$remainSeconds秒';
    }
  }

  String formatFare(int fare) {
    switch (language) {
      case AppLanguage.en:
        return '$fare KRW';
      case AppLanguage.zhHans:
      case AppLanguage.ja:
        return '₩$fare';
    }
  }

  String formatTransferCount(int transferCount) {
    switch (language) {
      case AppLanguage.en:
        return '$transferCount transfer${transferCount == 1 ? '' : 's'}';
      case AppLanguage.zhHans:
        return '换乘$transferCount次';
      case AppLanguage.ja:
        return '乗換$transferCount回';
    }
  }

  String formatStationCount(int stationCount) {
    switch (language) {
      case AppLanguage.en:
        return '$stationCount station${stationCount == 1 ? '' : 's'}';
      case AppLanguage.zhHans:
        return '$stationCount站';
      case AppLanguage.ja:
        return '$stationCount駅';
    }
  }

  String routeSummaryHeadline(String origin, String destination) {
    final String separator = _usesWideCaps ? ' → ' : ' → ';
    return '${displayLabel(origin)}$separator${displayLabel(destination)}';
  }

  String routeSummaryDescription(String departure, String arrival) {
    switch (language) {
      case AppLanguage.en:
        return 'From $departure to $arrival';
      case AppLanguage.zhHans:
        return '从$departure前往$arrival';
      case AppLanguage.ja:
        return '$departureから$arrivalまで';
    }
  }

  String routeTransferTitle(String stationName) {
    switch (language) {
      case AppLanguage.en:
        return 'Transfer: $stationName';
      case AppLanguage.zhHans:
        return '在$stationName换乘';
      case AppLanguage.ja:
        return '$stationNameで乗換';
    }
  }

  String routeRequestTimeText(DateTime value) {
    final String month = value.month.toString().padLeft(2, '0');
    final String day = value.day.toString().padLeft(2, '0');
    final String hour = value.hour.toString().padLeft(2, '0');
    final String minute = value.minute.toString().padLeft(2, '0');
    return '$routeRequestTimeLabel $month/$day $hour:$minute';
  }

  String routeUnavailableMessage(String code, String resultMessage) {
    switch (language) {
      case AppLanguage.en:
        return 'API returned [$code] $resultMessage.';
      case AppLanguage.zhHans:
        return 'API 返回了 [$code] $resultMessage。';
      case AppLanguage.ja:
        return 'API が [$code] $resultMessage を返しました。';
    }
  }

  String routeBuildFailureMessage(String code, {String? detail}) {
    final String normalizedDetail = detail?.trim() ?? '';
    switch (language) {
      case AppLanguage.en:
        return normalizedDetail.isEmpty
            ? 'Parser failed with $code.'
            : 'Parser failed with $code: $normalizedDetail';
      case AppLanguage.zhHans:
        return normalizedDetail.isEmpty
            ? '解析器失败：$code。'
            : '解析器失败：$code，$normalizedDetail';
      case AppLanguage.ja:
        return normalizedDetail.isEmpty
            ? 'パーサーが失敗しました: $code。'
            : 'パーサーが失敗しました: $code、$normalizedDetail';
    }
  }

  factory AppStrings.forLanguage(AppLanguage language) {
    switch (language) {
      case AppLanguage.en:
        return const AppStrings(
          language: AppLanguage.en,
          brand: 'Wayfinder',
          searchHeading: 'Where to?',
          searchSubheading: 'PLAN YOUR NEXT CONNECTION',
          searchDefaultOrigin: 'Seoul Station',
          searchOriginHint: 'Origin station',
          searchDestinationHint: 'Destination or place',
          searchGoCta: 'GO',
          navNavigate: 'Navigate',
          navSaved: 'Saved',
          navHistory: 'History',
          settingsTitle: 'Settings',
          settingsSectionGeneral: 'GENERAL',
          settingsLanguageLabel: 'Language',
          settingsLanguageDescription:
              'Choose the UI language used across the app.',
          settingsLanguageOptionEn: 'English',
          settingsLanguageOptionZhHans: 'Simplified Chinese',
          settingsLanguageOptionJa: 'Japanese',
          settingsClose: 'Close',
          routeActionLanguage: 'Language',
          routeEyebrow: 'Route',
          routeTravelTimeLabel: 'Travel Time',
          routeCorrectPlatformTitle: 'Correct Platform',
          routeWrongPlatformTitle: 'Wrong Platform',
          routeTowardsLabel: 'Towards',
          routeNextStationLabel: 'Next Station',
          routePreviousStationLabel: 'Previous Station',
          routeFromLabel: 'From',
          routeToLabel: 'To',
          routeNextActionTitle: 'Next Action',
          routeNextActionDescription:
              'Review the platform guidance again or head back to search for a new destination.',
          routeRequestTimeLabel: 'Request time',
          routeSearchAgain: 'Search Again',
          routeRefreshRoute: 'Refresh Route',
          routeLoadingTitle: 'Loading directions',
          routeLoadingDescription:
              'We are organizing the line, destination, and next-station guidance for this trip.',
          routeRetry: 'Retry',
          routeBack: 'Back',
          routeErrorNoDataTitle: 'No route data',
          routeErrorNoDataMessage:
              'Open this screen from the search page to load directions.',
          routeErrorStationsRequiredTitle: 'Stations required',
          routeErrorBothStationsMissingMessage:
              'Enter both departure and arrival stations.',
          routeErrorOriginMissingMessage:
              'Enter a departure station and try again.',
          routeErrorDestinationMissingMessage:
              'Enter an arrival station and try again.',
          routeErrorUnavailableTitle: 'Route unavailable',
          routeErrorUnavailableMessage:
              'The route API could not provide directions for this request.',
          routeErrorBuildTitle: 'Could not build directions',
          routeErrorBuildMessage:
              'The route data was loaded, but the app could not organize it for display.',
          routeErrorLoadTitle: 'Could not load route',
          routeErrorUnexpectedMessage:
              'An unexpected error occurred while loading directions.',
        );
      case AppLanguage.zhHans:
        return const AppStrings(
          language: AppLanguage.zhHans,
          brand: 'Wayfinder',
          searchHeading: '去哪里？',
          searchSubheading: '规划下一段换乘',
          searchDefaultOrigin: '首尔站',
          searchOriginHint: '出发站',
          searchDestinationHint: '到达站或目的地',
          searchGoCta: '出发',
          navNavigate: '导航',
          navSaved: '收藏',
          navHistory: '记录',
          settingsTitle: '设置',
          settingsSectionGeneral: '常规',
          settingsLanguageLabel: '语言',
          settingsLanguageDescription: '选择应用中使用的界面语言。',
          settingsLanguageOptionEn: '英语',
          settingsLanguageOptionZhHans: '简体中文',
          settingsLanguageOptionJa: '日语',
          settingsClose: '关闭',
          routeActionLanguage: '语言',
          routeEyebrow: '路线',
          routeTravelTimeLabel: '总用时',
          routeCorrectPlatformTitle: '正确站台',
          routeWrongPlatformTitle: '错误站台',
          routeTowardsLabel: '开往',
          routeNextStationLabel: '下一站',
          routePreviousStationLabel: '上一站',
          routeFromLabel: '出发',
          routeToLabel: '到达',
          routeNextActionTitle: '下一步',
          routeNextActionDescription: '可以再次确认站台方向，或立即返回搜索新的目的地。',
          routeRequestTimeLabel: '请求时间',
          routeSearchAgain: '重新搜索',
          routeRefreshRoute: '刷新路线',
          routeLoadingTitle: '正在加载路线信息',
          routeLoadingDescription: '正在整理线路、行驶方向和下一站信息。',
          routeRetry: '重试',
          routeBack: '返回',
          routeErrorNoDataTitle: '没有路线数据',
          routeErrorNoDataMessage: '请从搜索页面进入此页面以加载路线。',
          routeErrorStationsRequiredTitle: '需要填写车站',
          routeErrorBothStationsMissingMessage: '请输入出发站和到达站。',
          routeErrorOriginMissingMessage: '请输入出发站后再试。',
          routeErrorDestinationMissingMessage: '请输入到达站后再试。',
          routeErrorUnavailableTitle: '无法提供路线',
          routeErrorUnavailableMessage: '路线 API 无法返回这次请求的结果。',
          routeErrorBuildTitle: '无法生成路线展示',
          routeErrorBuildMessage: '路线数据已加载，但应用无法整理出展示内容。',
          routeErrorLoadTitle: '无法加载路线',
          routeErrorUnexpectedMessage: '加载路线时发生了意外错误。',
        );
      case AppLanguage.ja:
        return const AppStrings(
          language: AppLanguage.ja,
          brand: 'Wayfinder',
          searchHeading: 'どこへ？',
          searchSubheading: '次の乗り換えを計画',
          searchDefaultOrigin: 'ソウル駅',
          searchOriginHint: '出発駅',
          searchDestinationHint: '到着駅または目的地',
          searchGoCta: '検索',
          navNavigate: '経路',
          navSaved: '保存',
          navHistory: '履歴',
          settingsTitle: '設定',
          settingsSectionGeneral: '一般',
          settingsLanguageLabel: '言語',
          settingsLanguageDescription: 'アプリ全体で使用する表示言語を選択します。',
          settingsLanguageOptionEn: '英語',
          settingsLanguageOptionZhHans: '簡体字中国語',
          settingsLanguageOptionJa: '日本語',
          settingsClose: '閉じる',
          routeActionLanguage: '言語',
          routeEyebrow: '経路',
          routeTravelTimeLabel: '所要時間',
          routeCorrectPlatformTitle: '正しいホーム',
          routeWrongPlatformTitle: '反対側ホーム',
          routeTowardsLabel: '方面',
          routeNextStationLabel: '次の駅',
          routePreviousStationLabel: '前の駅',
          routeFromLabel: '出発',
          routeToLabel: '到着',
          routeNextActionTitle: '次の操作',
          routeNextActionDescription: 'ホーム案内をもう一度確認するか、新しい目的地を検索できます。',
          routeRequestTimeLabel: '取得時刻',
          routeSearchAgain: '再検索',
          routeRefreshRoute: '経路を更新',
          routeLoadingTitle: '経路を読み込み中',
          routeLoadingDescription: '路線、行先、次駅の案内を表示用に整理しています。',
          routeRetry: '再試行',
          routeBack: '戻る',
          routeErrorNoDataTitle: '経路データがありません',
          routeErrorNoDataMessage: '検索画面からこの画面を開いて経路を読み込んでください。',
          routeErrorStationsRequiredTitle: '駅名の入力が必要です',
          routeErrorBothStationsMissingMessage: '出発駅と到着駅の両方を入力してください。',
          routeErrorOriginMissingMessage: '出発駅を入力してからもう一度お試しください。',
          routeErrorDestinationMissingMessage: '到着駅を入力してからもう一度お試しください。',
          routeErrorUnavailableTitle: '経路を取得できません',
          routeErrorUnavailableMessage: 'この条件では経路 API から案内を取得できませんでした。',
          routeErrorBuildTitle: '経路を表示できません',
          routeErrorBuildMessage: '経路データは取得できましたが、表示用に整理できませんでした。',
          routeErrorLoadTitle: '経路を読み込めません',
          routeErrorUnexpectedMessage: '経路の読み込み中に予期しないエラーが発生しました。',
        );
    }
  }
}
