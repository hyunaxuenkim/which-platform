import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'features/settings/data/app_language_storage.dart';
import 'features/settings/domain/app_language.dart';
import 'features/settings/providers/app_language_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final AppLanguageStorage languageStorage = SharedPrefsAppLanguageStorage(
    preferences,
  );
  final AppLanguage initialLanguage =
      await languageStorage.load() ?? AppLanguage.en;

  runApp(
    ProviderScope(
      overrides: [
        initialAppLanguageProvider.overrideWithValue(initialLanguage),
        appLanguageStorageProvider.overrideWithValue(languageStorage),
      ],
      child: const WhichPlatformApp(),
    ),
  );
}
