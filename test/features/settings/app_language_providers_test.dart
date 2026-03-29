import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:which_platform/features/settings/data/app_language_storage.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';
import 'package:which_platform/features/settings/providers/app_language_providers.dart';

class _InMemoryAppLanguageStorage implements AppLanguageStorage {
  AppLanguage? savedLanguage;

  @override
  Future<AppLanguage?> load() async => savedLanguage;

  @override
  Future<void> save(AppLanguage language) async {
    savedLanguage = language;
  }
}

void main() {
  test('builds from injected initial language and persists updates', () async {
    final storage = _InMemoryAppLanguageStorage();
    final container = ProviderContainer(
      overrides: [
        initialAppLanguageProvider.overrideWithValue(AppLanguage.zhHans),
        appLanguageStorageProvider.overrideWithValue(storage),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(appLanguageProvider), AppLanguage.zhHans);

    await container
        .read(appLanguageProvider.notifier)
        .setLanguage(AppLanguage.ja);

    expect(container.read(appLanguageProvider), AppLanguage.ja);
    expect(storage.savedLanguage, AppLanguage.ja);
  });
}
