import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_absen/app/modules/dashboard/controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Pengguna"),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final profile = controller.profile.value;
        if (profile == null) {
          return Center(child: Text("Tidak ada data profil."));
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.teal.shade100,
                child: Text(
                  profile.name?[0].toUpperCase() ?? '',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              Text(
                profile.name ?? '-',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                profile.email ?? '-',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildTile(Icons.account_circle, "Nama", profile.name),
                      _buildTile(Icons.mail, "Email", profile.email),
                      _buildTile(Icons.badge, "NIP", profile.nip),
                      _buildTile(
                          Icons.place, "Tempat Lahir", profile.tempatLahir),
                      _buildTile(Icons.cake, "Tanggal Lahir", profile.tglLahir),
                      _buildTile(Icons.home, "Alamat", profile.alamat),
                      _buildTile(
                          Icons.wc, "Jenis Kelamin", profile.jenisKelamin),
                      _buildTile(
                          Icons.sentiment_satisfied, "Agama", profile.agama),
                      _buildTile(Icons.phone, "No Telepon", profile.noTelp),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTile(IconData icon, String title, String? value) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          subtitle: Text(value ?? "-", style: TextStyle(fontSize: 16)),
          leading: Icon(icon, color: Colors.teal),
        ),
        Divider(),
      ],
    );
  }
}
