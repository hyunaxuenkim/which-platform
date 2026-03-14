import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:which_platform/app/app.dart';

void main() {
  testWidgets('shows mobile app bootstrap screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: WhichPlatformApp()));
    await tester.pumpAndSettle();

    expect(find.text('서울 지하철 경로 안내'), findsOneWidget);
    expect(find.text('모바일 앱 기본 환경 구성이 완료되었습니다.'), findsOneWidget);
  });
}
