// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smart_absen/lib/app/modules/dashboard/controllers/kehadiran_controller.dart';

// class KehadiranView extends StatelessWidget {
//   final KehadiranController controller = Get.put(KehadiranController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Data Kehadiran")),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (controller.kehadiranList.isEmpty) {
//           return Center(child: Text("Tidak ada data kehadiran"));
//         }

//         return ListView.builder(
//           itemCount: controller.kehadiranList.length,
//           itemBuilder: (context, index) {
//             final item = controller.kehadiranList[index];
//             return Card(
//               margin: EdgeInsets.all(8),
//               child: ListTile(
//                 title: Text(item.user?.name ?? '-'),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Tanggal: ${item.tanggal ?? '-'}"),
//                     Text("Masuk: ${item.jamMasuk ?? '-'}"),
//                     Text("Keluar: ${item.jamKeluar ?? '-'}"),
//                     Text("Jam Kerja: ${item.jamKerja ?? '-'}"),
//                     Text("Status: ${item.status ?? '-'}"),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
