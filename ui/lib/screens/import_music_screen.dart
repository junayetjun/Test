import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import 'main_container.dart';

class ImportMusicScreen extends StatelessWidget {
  const ImportMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Import Music", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
             children: [
               const SizedBox(height: 10),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   _buildMusicIcon(FontAwesomeIcons.spotify, const Color(0xFF1DB954)),
                   _buildMusicIcon(FontAwesomeIcons.apple, Colors.redAccent), // Apple Music is typically red/pink in these designs
                   _buildMusicIcon(FontAwesomeIcons.amazon, Colors.lightBlue),
                   _buildMusicIcon(FontAwesomeIcons.diamond, Colors.black), // Tidal/Generic
                 ],
               ),
               const SizedBox(height: 30),
               // Artist Card
               Expanded(
                 child: Container(
                   width: double.infinity,
                   margin: const EdgeInsets.only(bottom: 20),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(30),
                     image: const DecorationImage(
                       image: NetworkImage("https://images.unsplash.com/photo-1493225255756-d9584f8606e9?auto=format&fit=crop&w=800&q=80"), // Placeholder
                       fit: BoxFit.cover,
                     ),
                   ),
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       gradient: LinearGradient(
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                       ),
                     ),
                     padding: const EdgeInsets.all(24),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Container(
                           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                           decoration: BoxDecoration(
                             color: Colors.white.withOpacity(0.2),
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child: Text(
                             "Hayley Williams",
                             style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12),
                           ),
                         ),
                         const SizedBox(height: 8),
                         Text(
                           "Roses Lotus Iris Violet",
                           textAlign: TextAlign.center,
                           style: GoogleFonts.poppins(
                             color: Colors.white,
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         const SizedBox(height: 20),
                         SizedBox(
                           width: double.infinity,
                           child: ElevatedButton(
                             onPressed: () {},
                             style: ElevatedButton.styleFrom(
                               backgroundColor: AppColors.primaryMint,
                               foregroundColor: Colors.black,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                             ),
                             child: const Text("Import"), 
                           ),
                         ),
                         const SizedBox(height: 10),
                         // Three dots menu
                         const Icon(Icons.more_vert, color: Colors.white70),
                       ],
                     ),
                   ),
                 ),
               ),
               GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const MainContainer()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "NEXT",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryMint,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Center(
                   child: Container(
                     width: 60,
                     height: 4,
                     decoration: BoxDecoration(
                       color: Colors.black12,
                       borderRadius: BorderRadius.circular(2),
                     ),
                   ),
                ),
             ],
          ),
        ),
      ),
    );
  }

  Widget _buildMusicIcon(IconData icon, Color bg) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: bg.withOpacity(0.2), // Light bg
      // But image 5 shows solid squares/icons. Let's do rounded squares.
      child: Container(
         width: 50, height: 50,
         decoration: BoxDecoration(
           color: bg,
           borderRadius: BorderRadius.circular(12),
         ),
         child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
