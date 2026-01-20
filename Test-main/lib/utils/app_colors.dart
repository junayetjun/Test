import 'package:flutter/material.dart';

/// App color palette extracted from design mockups
class AppColors {
  // Gradient Colors for Splash Screen
  static const Color gradientPurple = Color(0xFF6B4FBB);
  static const Color gradientBlue = Color(0xFF4A90E2);
  static const Color gradientCyan = Color(0xFF50E3C2);
  static const Color gradientGreen = Color(0xFF7ED321);
  
  // Primary Colors
  static const Color primaryCyan = Color(0xFF50E3C2);
  static const Color primaryGreen = Color(0xFF7ED321);
  
  // Button Gradient
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [primaryCyan, primaryGreen],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  
  // Splash Screen Gradient
  static const LinearGradient splashGradient = LinearGradient(
    colors: [
      gradientPurple,
      gradientBlue,
      gradientCyan,
      Color(0xFF9B59B6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Text Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textHint = Color(0xFF999999);
  
  // Background Colors
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  static const Color inputBackground = Color(0xFFF0F0F0);
  
  // Accent Colors
  static const Color accentGreen = Color(0xFF4CAF50);
  static const Color accentRed = Color(0xFFF44336);
  
  // Social Auth Colors
  static const Color googleRed = Color(0xFFDB4437);
  static const Color facebookBlue = Color(0xFF4267B2);
  static const Color appleBlack = Color(0xFF000000);
}
