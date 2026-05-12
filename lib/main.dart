import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const AndesGrowApp());
}

class AndesGrowApp extends StatelessWidget {
  const AndesGrowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AndesGrow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}
