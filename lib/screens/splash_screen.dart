import 'dart:async';
import 'package:flutter/material.dart';
import 'main_screen.dart';

// Halaman SplashScreen yang muncul pertama kali saat aplikasi dibuka
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer berfungsi untuk menunda perpindahan ke halaman utama
    // setelah 2.2 detik (2200 milidetik)
    Timer(const Duration(milliseconds: 2200), () {
      // pushReplacement digunakan agar splash tidak bisa di-back kembali
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //Warna latar belakang hitam penuh
      body: Center(
        //Menempatkan konten di tengah layar
        child: Column(
          mainAxisSize: MainAxisSize.min, // Agar kolom tidak memenuhi seluruh tinggi layar
          children: [
            //Logo aplikasi
            Image.asset(
              'assets/images/spotify_logo.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 16),

            //
            //Teks nama aplikasi di bawah logo
            const Text(
              'Spotify',
              style: TextStyle(
                color: Colors.white, // Warna teks putih
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5, // Sedikit jarak antar huruf
              ),
            ),
          ],
        ),
      ),
    );
  }
}
