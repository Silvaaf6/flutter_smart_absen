import 'package:smart_absen/app/modules/dashboard/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.profile.isEmpty) {
          return const Center(child: Text('Data tidak tersedia'));
        }

        final data = controller.profile.first;

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Biar tetap di tengah
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                data.cover != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(data.cover!),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.person),
                      ),
                const SizedBox(height: 16),
                Text(
                  data.name ?? '-',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  data.email ?? '-',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Jabatan: ${data.jabatan?.namaJabatan ?? '-'}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.fetchProfile(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
