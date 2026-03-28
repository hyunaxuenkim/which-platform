import 'package:flutter/material.dart';

import 'router/app_router.dart';

class WhichPlatformApp extends StatelessWidget {
  const WhichPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color scaffoldColor = Color(0xFFF5F6F7);

    return MaterialApp.router(
      title: 'Wayfinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0049E6),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: scaffoldColor,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: scaffoldColor,
          foregroundColor: Color(0xFF2C2F30),
          elevation: 0,
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 48,
            height: 1,
            color: Color(0xFF2C2F30),
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            height: 1.1,
            color: Color(0xFF2C2F30),
          ),
          headlineSmall: TextStyle(
            fontSize: 28,
            height: 1.2,
            color: Color(0xFF2C2F30),
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            height: 1.2,
            color: Color(0xFF2C2F30),
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            height: 1.3,
            color: Color(0xFF2C2F30),
          ),
          titleSmall: TextStyle(
            fontSize: 15,
            height: 1.3,
            color: Color(0xFF2C2F30),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.45,
            color: Color(0xFF2C2F30),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            height: 1.45,
            color: Color(0xFF2C2F30),
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            height: 1.2,
            color: Color(0xFF2C2F30),
          ),
          labelSmall: TextStyle(
            fontSize: 11,
            height: 1.2,
            color: Color(0xFF2C2F30),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Color(0xFFABADAE)),
          filled: true,
          fillColor: const Color(0xFFE0E3E4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
