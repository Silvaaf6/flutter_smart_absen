import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class IndexView extends GetView {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Absensi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol Check In
            ZoomTapAnimation(
              onTap: () {
                Get.snackbar("Check In", "Berhasil Check In");
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.login, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Check In",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ZoomTapAnimation(
                    onTap: () {
                      _showSakitForm(context);
                    },

                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.sick, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "Sakit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ZoomTapAnimation(
                    onTap: () {
                      _showCutiForm(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.edit_calendar, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "Pengajuan Cuti",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showSakitForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      TextEditingController alasanController = TextEditingController();
      return AlertDialog(
        title: const Text('Form Sakit'),
        content: TextField(
          controller: alasanController,
          decoration: const InputDecoration(
            labelText: 'Alasan Sakit',
          ),
        ),
        actions: [
          // TextButton(
          //   onPressed: () => Navigator.pop(context),
          //   child: const Text('Batal'),
          // ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Get.snackbar("Sakit", "Alasan: ${alasanController.text}");
            },
            child: const Text('Kirim'),
          ),
        ],
      );
    },
  );
}

void _showCutiForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      TextEditingController alasanController = TextEditingController();
      return AlertDialog(
        title: const Text('Form Pengajuan Cuti'),
        content: TextField(
          controller: alasanController,
          decoration: const InputDecoration(
            labelText: 'Alasan Cuti',
          ),
        ),
        actions: [
          // TextButton(
          //   onPressed: () => Navigator.pop(context),
          //   child: const Text('Batal'),
          // ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Get.snackbar("Cuti", "Alasan: ${alasanController.text}");
            },
            child: const Text('Ajukan'),
          ),
        ],
      );
    },
  );
}

