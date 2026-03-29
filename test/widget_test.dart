import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:which_platform/app/app.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/database_provider.dart';
import 'package:which_platform/features/settings/data/app_language_storage.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';
import 'package:which_platform/features/settings/providers/app_language_providers.dart';

class _InMemoryAppLanguageStorage implements AppLanguageStorage {
  _InMemoryAppLanguageStorage({this.savedLanguage});

  AppLanguage? savedLanguage;

  @override
  Future<AppLanguage?> load() async => savedLanguage;

  @override
  Future<void> save(AppLanguage language) async {
    savedLanguage = language;
  }
}

ProviderScope _buildTestApp({
  required AppDatabase database,
  AppLanguage initialLanguage = AppLanguage.en,
  AppLanguageStorage? storage,
}) {
  return ProviderScope(
    overrides: [
      appDatabaseProvider.overrideWithValue(database),
      initialAppLanguageProvider.overrideWithValue(initialLanguage),
      appLanguageStorageProvider.overrideWithValue(
        storage ?? _InMemoryAppLanguageStorage(savedLanguage: initialLanguage),
      ),
    ],
    child: const WhichPlatformApp(),
  );
}

void main() {
  testWidgets('shows search screen as the first route', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(_buildTestApp(database: database));
    await tester.pumpAndSettle();

    expect(find.text('Wayfinder'), findsOneWidget);
    expect(find.text('Where to?'), findsOneWidget);
    expect(find.text('GO'), findsOneWidget);
    expect(find.text('Seoul Station'), findsOneWidget);
    expect(find.text('Origin station'), findsOneWidget);
    expect(find.text('Destination or place'), findsOneWidget);

    await database.close();
  });

  testWidgets('opens the shared settings sheet from the search screen', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(_buildTestApp(database: database));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsWidgets);
    expect(find.text('Close'), findsOneWidget);

    await database.close();
  });

  testWidgets('updates visible strings when the app language changes', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    final storage = _InMemoryAppLanguageStorage();

    await tester.pumpWidget(
      _buildTestApp(database: database, storage: storage),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Simplified Chinese').last);
    await tester.pumpAndSettle();

    expect(find.text('设置'), findsOneWidget);
    expect(find.text('关闭'), findsOneWidget);
    expect(find.text('Japanese'), findsNothing);
    expect(find.text('日本語'), findsOneWidget);
    expect(storage.savedLanguage, AppLanguage.zhHans);

    await tester.tap(find.text('关闭'));
    await tester.pumpAndSettle();

    expect(find.text('去哪里？'), findsOneWidget);
    expect(find.text('出发'), findsOneWidget);
    expect(find.text('首尔站'), findsOneWidget);
    expect(find.text('出发站'), findsOneWidget);
    expect(find.text('到达站或目的地'), findsOneWidget);
    expect(find.text('导航'), findsOneWidget);
    expect(find.text('WAYFINDER'), findsNothing);

    await database.close();
  });
}
