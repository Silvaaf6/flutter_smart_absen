import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class IndexView extends GetView {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSliderSection(),
            const SizedBox(height: 24),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderSection() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 182, 193, 255), Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: PageView(
        children: [
          _buildSliderItem('Welcome to Absensi', 'assets/images/image1.jpg'),
          _buildSliderItem('Stay Healthy', 'assets/images/image2.jpg'),
          _buildSliderItem('Track Your Attendance', 'assets/images/image3.jpg'),
        ],
      ),
    );
  }

  Widget _buildSliderItem(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
                color: Colors.black38,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionButton(
              context,
              title: "Check In",
              icon: Icons.login,
              color: Colors.green,
              onTap: () {
                Get.snackbar("Check In", "Berhasil Check In");
              },
            ),
            const SizedBox(width: 16),
            _buildActionButton(
              context,
              title: "Sakit",
              icon: Icons.sick,
              color: Colors.orange,
              onTap: () {
                _showSakitForm(context);
              },
            ),
            const SizedBox(width: 16),
            _buildActionButton(
              context,
              title: "Check Out",
              icon: Icons.logout,
              color: Colors.red,
              onTap: () {
                Get.snackbar("Check Out", "Berhasil Check Out");
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: ZoomTapAnimation(
        onTap: onTap,
        child: Material(
          borderRadius: BorderRadius.circular(12),
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSakitForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        TextEditingController alasanController = TextEditingController();
        return AlertDialog(
          title: const Text('Form Sakit', style: TextStyle(fontWeight: FontWeight.bold)),
          content: TextField(
            controller: alasanController,
            decoration: const InputDecoration(
              labelText: 'Alasan Sakit',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Get.snackbar("Sakit", "Alasan: ${alasanController.text}");
              },
              child: const Text('Kirim'),
              style: ElevatedButton.styleFrom(
                // primary: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }
}
