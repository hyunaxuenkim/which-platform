import 'package:flutter/material.dart';

import 'router/app_router.dart';

class WhichPlatformApp extends StatelessWidget {
  const WhichPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Seoul Metro Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B5CD5)),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
