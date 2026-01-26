import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(
          icon: FontAwesomeIcons.google,
          color: Colors.red,
          onTap: () {},
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          icon: FontAwesomeIcons.facebook,
          color: Colors.blue,
          onTap: () {},
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          icon: FontAwesomeIcons.apple,
          color: Colors.black,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSocialIcon({required IconData icon, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container( // No background circle as per image, just icons? 
        // Image 2 shows just icons.
        // Wait, looking closer at image 2... it's google logo, facebook logo, apple logo. 
        // Google is multicolored, FB is blue circle, Apple is black apple.
        // FontAwesome handles brand colors mostly if we style them.
        child: FaIcon(icon, size: 30, color: color),
      ),
    );
  }
}
