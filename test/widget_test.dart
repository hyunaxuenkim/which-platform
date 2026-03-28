import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:which_platform/app/app.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/database_provider.dart';

void main() {
  testWidgets('shows search screen as the first route', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const WhichPlatformApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Wayfinder'), findsOneWidget);
    expect(find.text('Where to?'), findsOneWidget);
    expect(find.text('Voice Guidance'), findsOneWidget);
    expect(find.text('GO'), findsOneWidget);

    await tester.tap(find.text('GO'));
    await tester.pumpAndSettle();

    expect(find.text('방향 결과 준비중'), findsOneWidget);
    expect(find.text('서울역 → 도착역 미입력'), findsOneWidget);

    await database.close();
  });
}
