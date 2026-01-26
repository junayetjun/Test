import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'import_music_screen.dart'; // Will be created next
import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Login screen usually doesn't have title "Login" in image 3, it just has clean top
        // But let's add transparent app bar for back button
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                "Email or username",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]), 
              ),
              const SizedBox(height: 8),
              _buildTextField("Email or username"),
              const SizedBox(height: 24),
              Text(
                "Password",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 8),
              _buildTextField("Password", obscureText: true),
              const SizedBox(height: 20),
              Row(
                children: [
                   Switch(
                     value: _rememberMe,
                     onChanged: (val) => setState(() => _rememberMe = val),
                     activeColor: AppColors.primaryMint,
                     activeTrackColor: AppColors.primaryMint.withOpacity(0.3),
                   ),
                   Text("Remember me", style: GoogleFonts.poppins(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 30),
               ElevatedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const ImportMusicScreen()));
                },
                child: const Text("Log in"),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Forgot your password?",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 100), // Spacer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateAccountScreen()));
                    },
                    child: Text(
                      "Sign up for Tune",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint, // Actually design labels are outside, fields have just text. 
        // Image 3 shows filled grey input with text inside "Email or username" as value? 
        // No, placeholder.
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}
