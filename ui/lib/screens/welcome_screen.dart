import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'login_screen.dart';
import 'create_account_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo placeholder - Headphones icon similar to image
              Stack(
                alignment: Alignment.center,
                children: [
                   Container(
                     height: 80,
                     width: 80,
                     decoration: BoxDecoration(
                       color: AppColors.primaryMint.withOpacity(0.2),
                       shape: BoxShape.circle,
                     ),
                   ),
                   const Icon(Icons.headphones, size: 60, color: Colors.black87),
                   // Little bars visualization
                   Positioned(
                     bottom: 15,
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Container(width: 4, height: 16, color: AppColors.primaryMint, margin: const EdgeInsets.symmetric(horizontal: 2)),
                         Container(width: 4, height: 24, color: Colors.black87, margin: const EdgeInsets.symmetric(horizontal: 2)),
                         Container(width: 4, height: 16, color: AppColors.primaryMint, margin: const EdgeInsets.symmetric(horizontal: 2)),
                       ],
                     ),
                   )
                ],
              ),
              const SizedBox(height: 40),
              Text(
                "Tune into Millions\nof Tracks!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateAccountScreen()));
                  },
                  child: const Text("Sign up free"),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F5F5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    "Log in",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                 width: 60,
                 height: 4,
                 decoration: BoxDecoration(
                   color: Colors.black12,
                   borderRadius: BorderRadius.circular(2),
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
