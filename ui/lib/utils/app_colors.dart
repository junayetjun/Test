import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryMint = Color(0xFF69F0AE); // Main action color
  static const Color backgroundLight = Colors.white;
  static const Color textDark = Colors.black;
  static const Color textGrey = Color(0xFF9E9E9E);
  static const Color inputFill = Color(0xFFF5F5F5); // Very light grey for inputs
  
  // Gradient for Onboarding
  static const LinearGradient onboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF6A11CB), // Purple
      Color(0xFF2575FC), // Blue
    ],
  );
}
