import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:which_platform/app/app.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/database_provider.dart';

void main() {
  testWidgets('shows database debug screen', (WidgetTester tester) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
        ],
        child: const WhichPlatformApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('서울 지하철 경로 안내'), findsOneWidget);
    expect(find.text('디버그용 DB Import 화면'), findsOneWidget);
    expect(find.text('Import Line Info'), findsOneWidget);

    await database.close();
  });
}
