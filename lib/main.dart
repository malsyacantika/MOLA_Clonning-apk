import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';

// Fungsi utama aplikasi yang dijalankan pertama kali
void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',

      // Menghilangkan banner debug di pojok kanan atas
      debugShowCheckedModeBanner: false,

      //tema gelap
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F0F), // Warna latar belakang utama
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white, // Warna teks utama
          displayColor: Colors.white, // Warna teks untuk tampilan besar
        ),
      ),

      // Halaman pertama yang ditampilkan saat aplikasi dibuka
      home: const SplashScreen(),
    );
  }
}
