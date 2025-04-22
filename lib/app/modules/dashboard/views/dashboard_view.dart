import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: Text(
            _getTitle(controller.selectedIndex.value),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Aksi logout, misalnya menghapus token dan kembali ke halaman login
                // Contoh jika menggunakan GetX:
                Get.defaultDialog(
                  title: "Konfirmasi",
                  middleText: "Apakah kamu yakin ingin logout?",
                  textCancel: "Batal",
                  textConfirm: "Logout",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    // Hapus token atau session
                    // Misalnya:
                    // box.remove('token'); atau GetStorage().erase();
                    // Setelah logout, arahkan ke halaman login
                    Get.offAllNamed('/login');
                  },
                );
              },
            ),
            const SizedBox(width: 10),
          ],

        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 186, 196, 255),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/login.jpg'),
                ),
                accountName: const Text('Selamat Datang!'),
                accountEmail: null, // Hapus email
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildDrawerItem(
                      context: context,
                      icon: Icons.home,
                      title: 'Index',
                      index: 0,
                      controller: controller,
                    ),
                    _buildDrawerItem(
                      context: context,
                      icon: Icons.history,
                      title: 'Riwayat',
                      index: 1,
                      controller: controller,
                    ),
                    _buildDrawerItem(
                      context: context,
                      icon: Icons.work,
                      title: 'Jabatan',
                      index: 2,
                      controller: controller,
                    ),
                    _buildDrawerItem(
                      context: context,
                      icon: Icons.event_note,
                      title: 'Pengajuan Cuti',
                      index: 3,
                      controller: controller,
                    ),
                    _buildDrawerItem(
                      context: context,
                      icon: Icons.person,
                      title: 'Profile',
                      index: 4,
                      controller: controller,
                    ),
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'SmartAbsen v1.0',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Navigator(
            key: Get.nestedKey(1),
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (_) =>
                    controller.pages[controller.selectedIndex.value],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required int index,
    required DashboardController controller,
  }) {
    final bool isSelected = controller.selectedIndex.value == index;
    return Material(
      color: isSelected ? Colors.indigo.withOpacity(0.1) : Colors.transparent,
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.indigo : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.indigo : Colors.black87,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        onTap: () {
          controller.changeIndex(index);
          Get.nestedKey(1)!.currentState!.pushReplacement(
                MaterialPageRoute(
                  builder: (_) => controller.pages[index],
                ),
              );
          Get.back();
        },
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Index';
      case 1:
        return 'Riwayat';
      case 2:
        return 'Jabatan';
      case 3:
        return 'Pengajuan Cuti';
      case 4:
        return 'Profile';
      default:
        return 'Dashboard';
    }
  }
}
