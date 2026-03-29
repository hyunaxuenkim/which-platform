import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/app_language_storage.dart';
import '../domain/app_language.dart';
import '../domain/app_strings.dart';

final initialAppLanguageProvider = Provider<AppLanguage>(
  (ref) => AppLanguage.en,
);

final appLanguageStorageProvider = Provider<AppLanguageStorage>((ref) {
  throw UnimplementedError('AppLanguageStorage must be overridden at app boot.');
});

class AppLanguageNotifier extends Notifier<AppLanguage> {
  @override
  AppLanguage build() => ref.watch(initialAppLanguageProvider);

  Future<void> setLanguage(AppLanguage language) async {
    if (state == language) {
      return;
    }
    state = language;
    await ref.read(appLanguageStorageProvider).save(language);
  }
}

final appLanguageProvider = NotifierProvider<AppLanguageNotifier, AppLanguage>(
  AppLanguageNotifier.new,
);

final appStringsProvider = Provider<AppStrings>((ref) {
  final AppLanguage language = ref.watch(appLanguageProvider);
  return AppStrings.forLanguage(language);
});
