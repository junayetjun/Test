import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'tournament_screen.dart';
import 'player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               // Header
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   GestureDetector(
                     onTap: () => Scaffold.of(context).openDrawer(),
                     child: Row(
                       children: [
                         const CircleAvatar(
                           backgroundImage: NetworkImage("https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=100&q=80"),
                           radius: 16,
                         ),
                         const SizedBox(width: 10),
                         Text("Hey, Jennifer", style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey, decoration: TextDecoration.none)),
                       ],
                     ),
                   ),
                   const Icon(Icons.search, color: Colors.black87),
                 ],
               ),
               const SizedBox(height: 20),
               // Featured Player Card
               GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PlayerScreen())),
                 child: Container(
                   padding: const EdgeInsets.all(16),
                   decoration: BoxDecoration(
                     color: const Color(0xFFA7F3D0), // Light Green
                     gradient: const LinearGradient(
                       colors: [Color(0xFF69F0AE), Color(0xFFA7F3D0)],
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                     ),
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Container(
                             width: 60, height: 60,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               image: const DecorationImage(
                                 image: NetworkImage("https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?auto=format&fit=crop&w=200&q=80"),
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                           const SizedBox(width: 12),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Imagine Dragons - Believer", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                               Text("Imagine Dragons", style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12)),
                             ],
                           ),
                           const Spacer(),
                           const Icon(Icons.push_pin, color: Colors.white, size: 20),
                         ],
                       ),
                       const SizedBox(height: 12),
                       // Progress Bar
                        Row(
                          children: [
                            Text("2:20", style: GoogleFonts.poppins(color: Colors.white70, fontSize: 10)),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                  trackHeight: 2,
                                  thumbColor: Colors.black,
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: Colors.white24,
                                ),
                                child: Slider(value: 0.6, onChanged: (v){}),
                              ),
                            ),
                            Text("3:17", style: GoogleFonts.poppins(color: Colors.white70, fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                             Icon(Icons.skip_previous, color: Colors.white70, size: 24),
                             SizedBox(width: 16),
                             Icon(Icons.play_arrow, color: Colors.black, size: 32),
                             SizedBox(width: 16),
                             Icon(Icons.skip_next, color: Colors.white70, size: 24),
                          ],
                        )
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 24),
               _buildSectionHeader("Popular radio"),
               _buildHorizontalList(
                items: [
                  _buildCardItem("Hits", "Modern", "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=200&q=80"),
                  _buildCardItem("Rock", "Nickelback", "https://images.unsplash.com/photo-1549490349-8643362247b5?auto=format&fit=crop&w=200&q=80"),
                  _buildCardItem("Pop", "Various", "https://images.unsplash.com/photo-1514525253440-b393452e8d26?auto=format&fit=crop&w=200&q=80"),
                ]
               ),
               const SizedBox(height: 24),
               _buildSectionHeader("Popular artists"),
                _buildHorizontalCircleList(),
               const SizedBox(height: 24),
               _buildSectionHeader("Popular albums and singles"),
               _buildHorizontalList(
                 items: [
                   _buildCardItem("Better", "Zayn", "https://images.unsplash.com/photo-1621360841013-c768371e93cf?auto=format&fit=crop&w=200&q=80"),
                   _buildCardItem("Un Verano", "Bad Bunny", "https://images.unsplash.com/photo-1624899896894-04de9b23b334?auto=format&fit=crop&w=200&q=80"),
                 ]
               ),
               const SizedBox(height: 24),
               _buildSectionHeader("What's new in music"),
               _buildHorizontalList(
                 items: [
                   _buildCardItem("Lizzo", "Top", "https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?auto=format&fit=crop&w=200&q=80", buttonText: "ADD"),
                   _buildCardItem("Podcast", "Exclusive", "https://images.unsplash.com/photo-1557804506-669a67965ba0?auto=format&fit=crop&w=200&q=80", buttonText: "PLAY"),
                 ]
               ),
               const SizedBox(height: 30),
               GestureDetector(
                onTap: () {}, // Import Music navigation maybe?
                 child: Container(
                   width: double.infinity,
                   padding: const EdgeInsets.symmetric(vertical: 12),
                   decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                   child: Center(child: Text("Import", style: GoogleFonts.poppins(fontWeight: FontWeight.w600))),
                 ),
               ),
               const SizedBox(height: 12),
               GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TournamentScreen())),
                 child: Container(
                   width: double.infinity,
                   padding: const EdgeInsets.symmetric(vertical: 12),
                   decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                   child: Center(child: Text("Leaderboard", style: GoogleFonts.poppins(fontWeight: FontWeight.w600))),
                 ),
               ),
               const SizedBox(height: 12),
               GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TournamentScreen())),
                 child: Container(
                   width: double.infinity,
                   padding: const EdgeInsets.symmetric(vertical: 20),
                   decoration: BoxDecoration(color: AppColors.primaryMint.withOpacity(0.5), borderRadius: BorderRadius.circular(12)),
                   child: Center(child: Text("Rank your songs >", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16))),
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _buildHorizontalList({required List<Widget> items}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: items.map((e) => Padding(padding: const EdgeInsets.only(right: 12.0), child: e)).toList()),
    );
  }

  Widget _buildCardItem(String title, String subtitle, String imageUrl, {String? buttonText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100, height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
          child: buttonText != null ? Align(
            alignment: Alignment.bottomCenter,
             child: Container(
               margin: const EdgeInsets.only(bottom: 8),
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
               decoration: BoxDecoration(color: AppColors.primaryMint, borderRadius: BorderRadius.circular(10)),
               child: Text(buttonText, style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.bold)),
             ),
          ) : null,
        ),
        const SizedBox(height: 4),
        SizedBox(width: 100, child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12))),
        SizedBox(width: 100, child: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey))),
      ],
    );
  }
  
  Widget _buildHorizontalCircleList() {
     final artists = [
       {"name": "Post Malone", "img": "https://images.unsplash.com/photo-1563240619-44ec00435138?auto=format&fit=crop&w=200&q=80"},
       {"name": "The Weeknd", "img": "https://images.unsplash.com/photo-1520186994231-6ea0019d8cc2?auto=format&fit=crop&w=200&q=80"},
       {"name": "Dua Lipa", "img": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80"},
       {"name": "Lil Nas X", "img": "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?auto=format&fit=crop&w=200&q=80"},
     ];
     
     return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: artists.map((a) => Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(a['img']!),
              ),
              const SizedBox(height: 4),
              Text(a['name']!, style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500)),
            ],
          ),
        )).toList(),
      ),
    );
  }
}
