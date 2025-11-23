import 'package:flutter/material.dart';

// Membuat class LibraryScreen yang bersifat Stateless (tidak memiliki state yang berubah)
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  // Widget khusus untuk menampilkan item dengan ikon dan teks (seperti "Add artists")
  Widget _addItem(IconData icon, String title) {
    return Row(
      children: [
        // Kotak berisi ikon
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E), // Warna latar belakang
            borderRadius: BorderRadius.circular(8), // Sudut membulat
          ),
          child: Icon(icon, color: Colors.white, size: 32),
        ),
        const SizedBox(width: 12), // Jarak antara ikon dan teks
        // Teks judul item
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // Fungsi utama untuk membangun tampilan halaman
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F), // Warna latar belakang halaman
      body: SafeArea(
        child: SingleChildScrollView( 
          // Membuat konten bisa di-scroll
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Elemen rata kiri
            children: [
              // HEADER: berisi foto profil, judul, dan ikon di kanan atas
              Row(
                children: const [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Your Library',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(), // Mendorong ikon ke kanan
                  Icon(Icons.search, color: Colors.white), // Ikon pencarian
                  SizedBox(width: 12),
                  Icon(Icons.add, color: Colors.white), // Ikon tambah
                ],
              ),
              const SizedBox(height: 18),

              // TOMBOL FILTER (Playlists)
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E), // Warna abu-abu gelap
                  borderRadius: BorderRadius.circular(20), // Sudut membulat
                ),
                child: const Text(
                  'Playlists',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // BARIS SORT (Recents)
              Row(
                children: const [
                  Icon(Icons.swap_vert, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Recents', style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 18),

              // BAGIAN LIKED SONGS
              ListTile(
                contentPadding: EdgeInsets.zero, // Menghapus padding default
                leading: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    // Gradien warna ungu ke biru
                    gradient: LinearGradient(
                      colors: [Colors.purpleAccent, Colors.blueAccent],
                    ),
                  ),
                  child: const Icon(Icons.favorite, color: Colors.white),
                ),
                // Judul playlist
                title: const Text(
                  'Liked Songs',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Keterangan di bawah judul
                subtitle: const Text(
                  'Playlist • 2 songs',
                  style: TextStyle(color: Colors.grey),
                ),
                // Ikon pin di sisi kanan
                trailing: const Icon(Icons.push_pin, color: Colors.green),
              ),

              const SizedBox(height: 18),

              // ITEM TAMBAHAN
              _addItem(Icons.add, 'Add artists'), // Tombol untuk menambah artis
              const SizedBox(height: 16),
              _addItem(Icons.add, 'Add podcasts & shows'), // Tombol untuk menambah podcast
            ],
          ),
        ),
      ),
    );
  }
}
