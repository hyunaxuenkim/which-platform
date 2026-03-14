import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('서울 지하철 경로 안내'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '모바일 앱 기본 환경 구성이 완료되었습니다.',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '이제 iOS와 Android 기준으로 기능 개발을 시작할 수 있습니다.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF4B5563),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('초기 구성'),
                  SizedBox(height: 8),
                  Text('- Riverpod 상태관리'),
                  Text('- go_router 라우팅'),
                  Text('- feature-first 디렉터리 구조'),
                  Text('- iOS / Android 전용 플랫폼 구성'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
