import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Profil")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        // Column utama untuk menampilkan data vertikal
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Foto / avatar (boleh pakai gambar dummy) [cite: 40, 47]
            const CircleAvatar(
              radius: 60,
              // Gambar dummy [cite: 40, 47]
              backgroundImage: NetworkImage(
                'https://picsum.photos/200?random=2',
              ),
            ),

            const SizedBox(height: 20),

            // Text nama, NIM/ID, dan email (dalam Column) [cite: 41, 42, 46]
            const Text(
              "Nur Kholis Majid", // Nama dummy
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Npm ;23670020", // NIM/ID dummy [cite: 41]
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            const Text(
              "nur kholis@gmail.com", // Email dummy [cite: 41]
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),

            const Divider(height: 40, thickness: 1),

            // Row kecil untuk info lain (Prodi - Semester)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Icon
                const Icon(Icons.class_, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                // Text Prodi
                const Text(
                  "Prodi: Informatika",
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(width: 20),

                // Icon
                const Icon(Icons.calendar_month, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                // Text Semester
                const Text("Semester: 5", style: TextStyle(fontSize: 16)),
              ],
            ),

            const Divider(height: 40, thickness: 1),

            // Tombol Kembali ke Dashboard [cite: 44]
            ElevatedButton.icon(
              onPressed: () {
                // Tombol Kembali ke Dashboard (pakai Navigator.pop)
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali ke Dashboard"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
