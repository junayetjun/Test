import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background - Image with orange light
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1514533248661-3896d84d6d5e?auto=format&fit=crop&w=800&q=80"), // Silhouette on chair
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(
            decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: [Colors.orange.withOpacity(0.5), Colors.black.withOpacity(0.9)],
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
               )
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // AppBar area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
                      Row(
                         children: [
                            const Icon(Icons.favorite_border, color: Colors.white),
                            const SizedBox(width: 20),
                            const Icon(Icons.menu, color: Colors.white),
                         ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                // Player Card Overlay
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50, height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?auto=format&fit=crop&w=200&q=80"), fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Imagine Dragons - Believer", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                            Text("Imagine Dragons", style: GoogleFonts.poppins(color: Colors.white70, fontSize: 10)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Artist details bottom sheet look
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Imagine Dragons", style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                           const CircleAvatar(radius: 12, backgroundImage: NetworkImage("https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?auto=format&fit=crop&w=100&q=80")),
                           const SizedBox(width: 8),
                           Text("Imagine Dragons", style: GoogleFonts.poppins(fontSize: 12)),
                           const Spacer(),
                           Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(color: AppColors.primaryMint, borderRadius: BorderRadius.circular(20)),
                              child: Text("FOLLOW", style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.bold)),
                           ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text("26,234,32 Likes   12,324 Comments", style: GoogleFonts.poppins(color: AppColors.primaryMint, fontSize: 10)),
                      const SizedBox(height: 12),
                      Text("Inside my head, I am full of the words inside my head...", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
