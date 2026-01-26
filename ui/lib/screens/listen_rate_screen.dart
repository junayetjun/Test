import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'player_screen.dart';

class ListenRateScreen extends StatelessWidget {
  const ListenRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Listen and rate", style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue), // Blue back button as per image
          onPressed: () => Navigator.pop(context), 
        ),
        actions: const [
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildBigPlayerCard(context, "Imagine Dragons - Believer", "Imagine Dragons", "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?auto=format&fit=crop&w=400&q=80", color: const Color(0xFF5D1212)), // Dark red/orange
          const SizedBox(height: 20),
          _buildBigPlayerCard(context, "Imagine Dragons - Believer", "Imagine Dragons", "https://images.unsplash.com/photo-1493225255756-d9584f8606e9?auto=format&fit=crop&w=400&q=80", color: const Color(0xFF1E272E)), // Dark blue/grey
        ],
      ),
    );
  }

  Widget _buildBigPlayerCard(BuildContext context, String title, String artist, String img, {required Color color}) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PlayerScreen())),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, color.withOpacity(0.9)],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(artist, style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 12)),
                  const SizedBox(height: 16),
                  // Controls
                  Row(
                    children: [
                      Text("0:24", style: GoogleFonts.poppins(color: Colors.white70, fontSize: 10)),
                      Expanded(
                        child: Builder(
                          builder: (context) => SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white24,
                              thumbColor: Colors.white,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                              trackHeight: 2,
                            ),
                            child: Slider(value: 0.3, onChanged: (v){}),
                          ),
                        ),
                      ),
                      Text("3:40", style: GoogleFonts.poppins(color: Colors.white70, fontSize: 10)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.shuffle, color: Colors.white54, size: 20),
                      Icon(Icons.skip_previous, color: Colors.white, size: 28),
                      Icon(Icons.play_arrow, color: Colors.white, size: 40),
                      Icon(Icons.skip_next, color: Colors.white, size: 28),
                      Icon(Icons.repeat, color: Colors.white54, size: 20),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
