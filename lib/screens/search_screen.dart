import 'package:flutter/material.dart';
import 'profile_screen.dart';

// Halaman "Search"
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  //Widget untuk kategori
  Widget _categoryCard(String title, Color color, String imageAsset) {
    return Container(
      decoration: BoxDecoration(
        color: color, // Warna dasar kartu
        borderRadius: BorderRadius.circular(10),
        image: imageAsset.isNotEmpty
            ? DecorationImage(
                image: AssetImage(imageAsset),
                alignment: Alignment.topRight, // Gambar di pojok kanan atas
                fit: BoxFit.contain, // Gambar disesuaikan dengan ukuran kartu
              )
            : null,
      ),
      padding: const EdgeInsets.all(14),
      child: Align(
        alignment: Alignment.bottomLeft, // Teks di pojok kiri bawah
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  //Widget untuk kartu Discover (horizontal scroll berisi rekomendasi)
  Widget _discoverCard(String img, String text) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
      // Overlay hitam transparan di bawah teks agar lebih terbaca
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.black38,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang utama (tema gelap)
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        // Agar konten tidak tertutup status bar
        child: SingleChildScrollView(
          //Membungkus seluruh konten agar bisa discroll jika konten panjang
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Bagian Header (foto profil, judul Search, ikon kamera)
              Row(
                children: [
                  GestureDetector(
                    // Ketika foto profil diklik → pindah ke ProfileScreen
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.camera_alt_outlined, color: Colors.white),
                ],
              ),

              const SizedBox(height: 18),

              //Kotak pencarian (Search Bar)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Warna putih agar kontras
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.black),
                    hintText: 'What do you want to listen to?',
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              //Judul bagian kategori
              const Text(
                'Start browsing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              // Grid berisi kategori (2 kolom)
              GridView.count(
                crossAxisCount: 2, // 2 kolom per baris
                shrinkWrap: true, // Agar bisa berada dalam SingleChildScrollView
                physics: const NeverScrollableScrollPhysics(), // Scroll ikut parent
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _categoryCard(
                      'Music', const Color(0xFFE91E63), 'assets/images/album1.jpeg'),
                  _categoryCard(
                      'Chase', const Color(0xFF00695C), 'assets/images/album3.jpeg'),
                  _categoryCard(
                      'Live Events', const Color(0xFF7B1FA2), 'assets/images/album10.jpeg'),
                  _categoryCard(
                      'PartyNDoor', const Color(0xFF2962FF), 'assets/images/album7.jpeg'),
                ],
              ),

              const SizedBox(height: 18),

              // Bagian Discover
              const Text(
                'Discover something new',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              //Daftar horizontal untuk rekomendasi konten
              SizedBox(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _discoverCard('assets/images/album2.png', '#secret admirer'),
                    _discoverCard('assets/images/album8.png', '#galau bangt'),
                    _discoverCard('assets/images/album9.png', 'Podcasts for you'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
