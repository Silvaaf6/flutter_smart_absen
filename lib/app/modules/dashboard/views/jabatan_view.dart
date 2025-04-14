import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/jabatan_controller.dart';

class JabatanView extends StatefulWidget {
  const JabatanView({super.key});

  @override
  State<JabatanView> createState() => _JabatanViewState();
}

class _JabatanViewState extends State<JabatanView> {
  final JabatanController jabatanController = Get.put(JabatanController());

  @override
  void initState() {
    super.initState();
    jabatanController.fetchJabatanData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Jabatan'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (jabatanController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Daftar Jabatan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(child: JabatanList()),
            ],
          ),
        );
      }),
    );
  }
}

class JabatanList extends StatelessWidget {
  final JabatanController jabatanController = Get.find<JabatanController>();

  JabatanList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (jabatanController.jabatanList.isEmpty) {
        return const Center(child: Text('Belum ada jabatan.'));
      }

      return ListView.builder(
        itemCount: jabatanController.jabatanList.length,
        itemBuilder: (context, index) {
          final jabatan = jabatanController.jabatanList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(jabatan.namaJabatan ?? 'No name'),
            ),
          );
        },
      );
    });
  }
}
