import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'profile_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
                },
                child: Row(
                  children: [
                     const CircleAvatar(
                       radius: 30,
                       backgroundImage: NetworkImage("https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=200&q=80"), // Placeholder
                     ),
                     const SizedBox(width: 16),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           "Jennifer",
                           style: GoogleFonts.poppins(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.black,
                           ),
                         ),
                         Text(
                           "View profile",
                           style: GoogleFonts.poppins(
                             fontSize: 12,
                             color: Colors.grey,
                           ),
                         ),
                       ],
                     )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          _buildMenuItem(Icons.add_circle_outline, "Import Music"),
          _buildMenuItem(Icons.flash_on_outlined, "What's new"),
          _buildMenuItem(Icons.history, "Recents"),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2), // Mimicking the selection box in image
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.settings_outlined, color: Colors.blue),
                  const SizedBox(width: 16),
                  Text(
                    "Settings and privacy",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Center(
             child: Container(
               width: 60,
               height: 4,
               margin: const EdgeInsets.only(bottom: 20),
               decoration: BoxDecoration(
                 color: Colors.black12,
                 borderRadius: BorderRadius.circular(2),
               ),
             ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      onTap: () {},
    );
  }
}
