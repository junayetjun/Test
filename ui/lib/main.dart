import 'package:flutter/material.dart';
import 'utils/app_theme.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const TuneEntertainmentApp());
}

class TuneEntertainmentApp extends StatelessWidget {
  const TuneEntertainmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tune Entertainment',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
