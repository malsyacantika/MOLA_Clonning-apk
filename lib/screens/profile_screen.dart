import 'package:flutter/material.dart';

// Halaman profil pengguna (Profile Screen)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang halaman (gelap seperti tema Spotify)
      backgroundColor: const Color(0xFF121212),

      // Bagian AppBar (header atas)
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparan agar selaras dengan background
        elevation: 0, // menghilangkan bayangan bawah AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          // Kembali ke halaman sebelumnya
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // Isi utama halaman
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian foto profil dan nama pengguna
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foto profil pengguna
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
                SizedBox(width: 20),

                // Nama pengguna dan jumlah pengikut
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'cheyyy', // nama pengguna
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '99 followers • 3 following', // info followers dan following
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Tombol edit profil dan ikon share
            Row(
              children: [
                // Tombol Edit profil
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan fungsi edit profil di sini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A2A2A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(width: 10),

                // Tombol share profil
                IconButton(
                  onPressed: () {
                    // Tambahkan aksi share profil di sini
                  },
                  icon: const Icon(Icons.share_outlined, color: Colors.white),
                ),

                // Ikon tambahan (opsi lainnya)
                const Icon(Icons.more_horiz, color: Colors.white),
              ],
            ),

            const SizedBox(height: 50),

            // Bagian aktivitas terbaru pengguna
            const Center(
              child: Column(
                children: [
                  // Jika belum ada aktivitas
                  Text(
                    'No recent activity.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Check out some new music now',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
