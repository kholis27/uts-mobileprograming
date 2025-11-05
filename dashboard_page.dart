import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import halaman tujuan navigasi

class DashboardPage extends StatelessWidget {
  // Menerima data nama user dari halaman sebelumnya
  final String userName;
  const DashboardPage({super.key, required this.userName});

  // Widget untuk setiap item menu
  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget destinationPage,
  ) {
    // Menggunakan Column untuk Icon + Text [cite: 37, 49]
    return InkWell(
      onTap: () {
        // Navigasi ke Halaman Profil (atau halaman lain) [cite: 38, 50]
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Icon menu [cite: 37, 48]
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 5),
          // Text menu [cite: 37, 46]
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar berisi judul aplikasi dan icon notifikasi [cite: 31]
      appBar: AppBar(
        title: const Text("Aplikasi Kampus"),
        actions: const <Widget>[
          // Icon notifikasi [cite: 31, 48]
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: null, // Aksi notifikasi
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Column utama halaman [cite: 49]
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Bagian header berisi text nama user [cite: 32, 46]
              Text(
                "Halo, ${userName}", // Tampilkan nama user (misal: "Halo, Andi")
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Gambar/banner di atas (asset lokal/dummy) [cite: 33, 47]
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    // Gambar dummy [cite: 33, 47]
                    image: NetworkImage(
                      'https://picsum.photos/600/150?random=1',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Banner Informasi Kampus",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Menu Utama",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 15),

              // Tampilkan menu dalam bentuk Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Menu 1: Profil (pindah ke Halaman Profil) [cite: 34, 38]
                  _buildMenuItem(
                    context,
                    Icons.person,
                    "Profil",
                    const ProfilePage(),
                  ),

                  // Menu 2: Data (hanya dummy) [cite: 35]
                  _buildMenuItem(
                    context,
                    Icons.list,
                    "Data",
                    const DummyPage(title: "Halaman Data"),
                  ),

                  // Menu 3: Pengaturan (hanya dummy) [cite: 36]
                  _buildMenuItem(
                    context,
                    Icons.settings,
                    "Pengaturan",
                    const DummyPage(title: "Halaman Pengaturan"),
                  ),
                ],
              ),
              // Jika ingin Grid, ganti Row dengan GridView.builder atau GridView.count [cite: 34]
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman dummy untuk Data dan Pengaturan
class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Ini adalah $title")),
    );
  }
}
