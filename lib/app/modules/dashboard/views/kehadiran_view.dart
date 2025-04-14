import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_absen/app/modules/dashboard/controllers/kehadiran_controller.dart';

class KehadiranView extends StatelessWidget {
  KehadiranView({super.key});
  final KehadiranController controller = Get.put(KehadiranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Kehadiran',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 206, 224, 255),
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.kehadiranList.isEmpty) {
          return const Center(child: Text("Tidak ada data kehadiran."));
        }

        return ListView.builder(
          itemCount: controller.kehadiranList.length,
          itemBuilder: (context, index) {
            final item = controller.kehadiranList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                  size: 40,
                ),
                title: Text(
                  item.user?.name ?? 'Nama tidak tersedia',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  "Tanggal: ${item.tanggal ?? '-'}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Masuk: ${item.jamMasuk ?? '-'}",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "Keluar: ${item.jamKeluar ?? '-'}",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
