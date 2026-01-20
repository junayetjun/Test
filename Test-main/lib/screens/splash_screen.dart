import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/gradient_button.dart';
import 'welcome_screen.dart';

/// Splash screen with gradient background
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Content Overlay
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Skip button
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Bottom content
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // App Branding
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'YOUR MUSIC SPACE',
                              style: TextStyle(
                                color: AppColors.textWhite.withOpacity(0.6),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Smart Music',
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Tune ',
                                    style: TextStyle(
                                      color: AppColors.primaryCyan,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Entertainment',
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(height: 40),
                   
                   // Next Button (Centered or aligned as per design)
                   Center(
                      child: GestureDetector(
                        onTap: () {
                           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                             const Text(
                              'NEXT',
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryCyan, // Using primary color for the arrow bg
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.black, // Dark icon on bright circle
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                   ),
                   const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
