import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Import halaman tujuan navigasi

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // GlobalKey untuk validasi form
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk validasi dan navigasi
  void _doLogin() {
    // Validasi sederhana: Login tidak boleh kosong
    if (_formKey.currentState!.validate()) {
      // Navigasi ke Halaman Dashboard [cite: 54]
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          // Mengirimkan nama user dummy untuk Dashboard
          builder: (context) => DashboardPage(
            userName: _usernameController.text.isEmpty
                ? "Andi"
                : _usernameController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Menggunakan Scaffold untuk struktur dasar
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          // Menggunakan Column untuk menata data vertikal [cite: 49]
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Gambar (logo dummy/avatar) [cite: 25, 47]
              const Icon(
                Icons.school,
                size: 100,
                color: Colors.blue,
              ), // Ganti dengan Image.asset('path/to/logo.png')

              const SizedBox(height: 20),

              // Text judul: "Selamat Datang" [cite: 23, 46]
              const Text(
                "Selamat Datang",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              // Text kecil deskripsi aplikasi [cite: 24, 46]
              const Text(
                "Silakan masuk untuk melanjutkan ke aplikasi AMP.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 40),

              // Form untuk validasi
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // TextField: email/username [cite: 26]
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Email/Username',
                        // Icon di textfield [cite: 28, 48]
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      // Validasi tidak boleh kosong
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username tidak boleh kosong';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // TextField: password [cite: 26]
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        // Icon di textfield [cite: 28, 48]
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      // Validasi tidak boleh kosong
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // tombol Login [cite: 27]
              ElevatedButton(
                onPressed: _doLogin,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Login", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
