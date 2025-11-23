import 'package:flutter/material.dart';
// Import file halaman lain
import 'home_screen.dart';
import 'search_screen.dart';
import 'library_screen.dart';

// Membuat class MainScreen sebagai StatefulWidget
// Karena halaman ini akan berubah (misalnya saat tombol navigasi ditekan)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// State dari MainScreen, tempat logika perubahan tampilan berada
class _MainScreenState extends State<MainScreen> {
  // Menyimpan indeks halaman yang sedang aktif (default = 0, yaitu Home)
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan pada tiap tab navigasi
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),     // Halaman Home
    SearchScreen(),   // Halaman Search
    LibraryScreen(),  // Halaman Library
  ];

  // Fungsi untuk mengganti halaman ketika item navigasi ditekan
  void _onTap(int idx) => setState(() => _selectedIndex = idx);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman sesuai tab yang dipilih
      body: _pages[_selectedIndex],

      // Bagian navigasi bawah (Bottom Navigation Bar)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0F0F0F), // Warna latar belakang hitam
        currentIndex: _selectedIndex, // Menentukan tab yang sedang aktif
        selectedItemColor: Colors.white, // Warna ikon & teks saat aktif
        unselectedItemColor: Colors.grey, // Warna ikon & teks saat tidak aktif
        onTap: _onTap, // Panggil fungsi ketika tab ditekan
        type: BottomNavigationBarType.fixed, // Menjaga posisi ikon tetap sejajar
        items: const [
          // Item navigasi untuk Home
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Home'),
          // Item navigasi untuk Search
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
          // Item navigasi untuk Library
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Your Library'),
        ],
      ),
    );
  }
}
