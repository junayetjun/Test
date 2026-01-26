import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
           Padding(
             padding: EdgeInsets.only(right: 16.0),
             child: Icon(Icons.search, color: AppColors.primaryMint), // Search icon with background? Image shows Mint icon.
           )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                   TextSpan(text: "TuneTournament:\n", style: GoogleFonts.poppins(color: AppColors.primaryMint, fontSize: 24, fontWeight: FontWeight.bold)),
                   TextSpan(text: "Every beat is a fight!", style: GoogleFonts.poppins(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Featured Battle/Song
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1542208998-f6dbbb27a72f?auto=format&fit=crop&w=400&q=80"), // Falling shoes/dark vibe
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.8)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    ),
                  ),
                   Align(
                     alignment: Alignment.center,
                     child: Icon(Icons.play_circle_fill, color: Colors.white, size: 50),
                   ),
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text("Roses Lotus Iris Violet", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
                           const SizedBox(height: 8),
                           Container(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (){}, 
                                child: Text("Import"),
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryMint, foregroundColor: Colors.black),
                              )
                           ),
                         ],
                       ),
                     ),
                   )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Category", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                 Text("See All", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildChip("Trend", true),
                  _buildChip("Jazz", false),
                  _buildChip("Blues", false),
                  _buildChip("Oldies", false),
                  _buildChip("Instrumental", false),
                ],
              ),
            ),
             const SizedBox(height: 24),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                  Text("New Song List", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("See All", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
               ],
             ),
             _buildSongList(),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryMint : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: GoogleFonts.poppins(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }
  
  Widget _buildSongList() {
    return Column(
      children: [
         ListTile(
           leading: Container(width: 50, height: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?auto=format&fit=crop&w=200&q=80"), fit: BoxFit.cover))),
           title: Text("Roses Lotus Iris Violet", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12)),
           subtitle: Text("Hayley Williams", style: GoogleFonts.poppins(fontSize: 10)),
           trailing: Text("#1", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
         ),
         // More items...
      ],
    );
  }
}
