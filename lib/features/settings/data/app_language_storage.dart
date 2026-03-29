import 'package:shared_preferences/shared_preferences.dart';

import '../domain/app_language.dart';
import '../domain/app_language_extensions.dart';

abstract class AppLanguageStorage {
  Future<AppLanguage?> load();

  Future<void> save(AppLanguage language);
}

class SharedPrefsAppLanguageStorage implements AppLanguageStorage {
  SharedPrefsAppLanguageStorage(this._preferences);

  static const String _languageCodeKey = 'app_language_code';

  final SharedPreferences _preferences;

  @override
  Future<AppLanguage?> load() async {
    final String? rawValue = _preferences.getString(_languageCodeKey);
    return AppLanguageX.fromStorageCode(rawValue);
  }

  @override
  Future<void> save(AppLanguage language) async {
    await _preferences.setString(_languageCodeKey, language.storageCode);
  }
}
