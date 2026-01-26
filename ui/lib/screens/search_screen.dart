import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "What do you want to listen to?",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  suffixIcon: const Icon(Icons.mic, color: AppColors.primaryMint), // Approx icon
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Start ", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                    TextSpan(text: "Browsing", style: GoogleFonts.poppins(fontSize: 20, color: Colors.grey[400])),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildGenreCard("Pop", "https://images.unsplash.com/photo-1514525253440-b393452e8d26?auto=format&fit=crop&w=200&q=80")),
                  const SizedBox(width: 12),
                  Expanded(child: _buildGenreCard("Podcast", "https://images.unsplash.com/photo-1557804506-669a67965ba0?auto=format&fit=crop&w=200&q=80", isPurple: true)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildGenreCard("Jumping", "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&w=200&q=80")),
                ],
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Top Vocalists"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildWideCard("MARSHMELLO", Colors.lightGreenAccent.withOpacity(0.4), "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=200&q=80"),
                    const SizedBox(width: 16),
                    _buildWideCard("IMAGINE DRAGONS", Colors.greenAccent.withOpacity(0.4), "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?auto=format&fit=crop&w=200&q=80"),
                  ],
                ),
              ),
               const SizedBox(height: 24),
               _buildSectionHeader("Your Favorites"),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   _buildCircleArtist("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80"),
                   _buildCircleArtist("https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80"),
                   _buildCircleArtist("https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?auto=format&fit=crop&w=200&q=80"),
                   _buildCircleArtist("https://images.unsplash.com/photo-1563240619-44ec00435138?auto=format&fit=crop&w=200&q=80"),
                 ],
               )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Text(title.split(" ")[0], style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(" " + title.split(" ").skip(1).join(" "), style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildGenreCard(String title, String img, {bool isPurple = false}) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: isPurple ? Colors.purpleAccent : AppColors.primaryMint,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(isPurple ? "PLAYING" : "PLAY", style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildWideCard(String title, Color color, String img) {
    return Container(
      width: 250,
      height: 120,
     decoration: BoxDecoration(
       color: color,
       borderRadius: BorderRadius.circular(16),
     ),
     child: Row(
       children: [
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 100),
            child: Text(title, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, height: 1.0))
           ),
         ),
         Expanded(
           child: ClipRRect(
             borderRadius: const BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
             child: Image.network(img, fit: BoxFit.cover, height: double.infinity),
           ),
         ),
       ],
     ),
    );
  }
  
  Widget _buildCircleArtist(String img) {
    return CircleAvatar(
      radius: 35,
      backgroundImage: NetworkImage(img),
    );
  }
}
