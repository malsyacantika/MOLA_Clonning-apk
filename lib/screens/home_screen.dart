import 'package:flutter/material.dart';

// Stateless (tidak memiliki state yang bisa berubah)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Widget custom untuk menampilkan tombol kategori 
  Widget _filterChip(String text, {bool active = false}) {
    return Container(
      // Memberi jarak dalam tombol
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        // Warna tombol berubah jika aktif
        color: active ? const Color(0xFF1DB954) : const Color(0xFF1E1E1E),
        // Membuat sudut tombol menjadi melengkung
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          // Tulisan lebih tebal kalau chip aktif
          fontWeight: active ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }

  // Widget custom untuk menampilkan satu baris playlist
  Widget _playlistTile(String img, String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      // Memberi ruang di dalam tile
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          // Gambar cover playlist
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              img,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12), // Jarak antara gambar dan teks
          // Menampilkan judul playlist
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2, // Maksimal dua baris
              overflow: TextOverflow.ellipsis, // Jika teks panjang, pakai tanda titik-titik (...)
            ),
          )
        ],
      ),
    );
  }

  //Widget custom untuk menampilkan lagu terbaru
  Widget _songRow(String img, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero, // Menghapus padding default ListTile
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(img, width: 56, height: 56, fit: BoxFit.cover),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(Icons.more_horiz, color: Colors.grey), // Icon titik tiga di kanan
    );
  }

  // Widget custom untuk menampilkan kartu "Recents"
  Widget _recentCard(String img, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(right: 12), // Jarak antar kartu
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
        children: [
          // Gambar album atau playlist
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              img,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          // Judul lagu / playlist
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // Subtitle (misal nama pembuat playlist)
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Bagian utama tampilan (UI utama)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F), // Warna latar belakang hitam gelap
      body: SafeArea(
        child: SingleChildScrollView(
          // Agar halaman bisa di-scroll
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian atas: foto profil + filter + ikon more
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Foto profil yang bisa diklik menuju halaman profil
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[800],
                      backgroundImage:
                          const AssetImage('assets/images/profile.jpeg'),
                      onBackgroundImageError: (_, __) {}, // Mencegah error jika gambar gagal dimuat
                    ),
                  ),
                  const SizedBox(width: 12),
                  _filterChip('All', active: true), // Filter aktif
                  const SizedBox(width: 8),
                  _filterChip('Music'),
                  const SizedBox(width: 8),
                  _filterChip('Podcasts'),
                  const Spacer(), // Dorong elemen ke kiri
                  const Icon(Icons.more_vert, color: Colors.white), // Ikon titik tiga
                ],
              ),

              const SizedBox(height: 18),

              // Bagian Recent Songs
              _songRow('assets/images/album1.jpeg', "About You", "The 1975"),
              _songRow('assets/images/album2.png', "Vampire", "Olivia Rodrigo"),

              const SizedBox(height: 12),

              // Bagian Playlist
              const Text(
                "Your Playlists",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Menampilkan daftar playlist
              Column(
                children: [
                  _playlistTile('assets/images/album7.jpeg', 'soo sadd'),
                  const SizedBox(height: 8),
                  _playlistTile('assets/images/album8.png', 'fall in love era'),
                  const SizedBox(height: 8),
                  _playlistTile('assets/images/album9.png', 'Arianatorrr'),
                ],
              ),

              const SizedBox(height: 24),

              // Bagian Recents
              const Text(
                "Recents",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Menampilkan kartu recents secara horizontal
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _recentCard('assets/images/album6.jpeg', 'begin again xixi',
                        'Playlist • chuyyaaa'),
                    _recentCard('assets/images/album2.png', 'love talk',
                        'Playlist • ugiyyyy'),
                    _recentCard('assets/images/album8.png', 'study vibes',
                        'Playlist • biekk'),
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
