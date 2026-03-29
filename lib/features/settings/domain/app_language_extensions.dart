import 'dart:ui';

import 'app_language.dart';

extension AppLanguageX on AppLanguage {
  bool get isCjk {
    switch (this) {
      case AppLanguage.en:
        return false;
      case AppLanguage.zhHans:
      case AppLanguage.ja:
        return true;
    }
  }

  String get storageCode {
    switch (this) {
      case AppLanguage.en:
        return 'en';
      case AppLanguage.zhHans:
        return 'zh-Hans';
      case AppLanguage.ja:
        return 'ja';
    }
  }

  Locale get locale {
    switch (this) {
      case AppLanguage.en:
        return const Locale('en');
      case AppLanguage.zhHans:
        return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
      case AppLanguage.ja:
        return const Locale('ja');
    }
  }

  String get endonym {
    switch (this) {
      case AppLanguage.en:
        return 'English';
      case AppLanguage.zhHans:
        return '简体中文';
      case AppLanguage.ja:
        return '日本語';
    }
  }

  static AppLanguage? fromStorageCode(String? code) {
    switch (code) {
      case 'en':
        return AppLanguage.en;
      case 'zh-Hans':
        return AppLanguage.zhHans;
      case 'ja':
        return AppLanguage.ja;
      default:
        return null;
    }
  }
}
