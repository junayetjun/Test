import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Profile", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.edit_outlined, color: Colors.black),
          )
        ],
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Avatar
            Center(
              child: Column(
                children: [
                   Container(
                     width: 100, height: 100,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: const Color(0xFFA7F3D0), // Light mint
                       border: Border.all(color: Colors.black, width: 2),
                     ),
                     child: Center(
                       child: Text("J", style: GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.bold)),
                     ),
                   ),
                   const SizedBox(height: 12),
                   Text("JENNIFER", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20)),
                   Text("jennifer.doe@gmail.com", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Align(alignment: Alignment.centerLeft, child: Text("Dashboard", style: GoogleFonts.poppins(fontWeight: FontWeight.w600))),
            const SizedBox(height: 16),
            // Dashboard Cards
            Row(
              children: [
                Expanded(child: _buildDashCard("My Library", Icons.music_note, const Color(0xFF69F0AE))),
                const SizedBox(width: 12),
                Expanded(child: _buildDashCard("Playlist", Icons.queue_music, const Color(0xFFA7F3D0), isMiddle: true)),
                const SizedBox(width: 12),
                Expanded(child: _buildDashCard("Download", Icons.download, const Color(0xFF69F0AE))),
              ],
            ),
            const SizedBox(height: 12),
            Container(width: double.infinity, height: 40, decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)), child: Center(child: Text("Feedback", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12)))),
            const SizedBox(height: 30),
            Align(alignment: Alignment.centerLeft, child: Text("Profile Settings", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.grey))),
            const SizedBox(height: 10),
            _buildSettingItem(Icons.person_outline, "Personal Details"),
            _buildSettingItem(Icons.lightbulb_outline, "Your Insights"),
            _buildSettingItem(Icons.notifications_outlined, "Notification"),
            const SizedBox(height: 20),
            Align(alignment: Alignment.centerLeft, child: Text("Marketing Tools", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.grey))),
            const SizedBox(height: 10),
            _buildSettingItem(Icons.analytics_outlined, "Analytics"),
            _buildSettingItem(Icons.chat_bubble_outline, "Communication"),
          ],
        ),
      ),
    );
  }

  Widget _buildDashCard(String title, IconData icon, Color bg, {bool isMiddle = false}) {
    // The middle one in design is distinctive, maybe lighter or structured differently, but here just color.
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 8),
          Text(title, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.grey[100], shape: BoxShape.circle),
        child: Icon(icon, color: Colors.black54, size: 20),
      ),
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}
