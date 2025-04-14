import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_absen/app/modules/dashboard/views/dashboard_view.dart';
import 'package:smart_absen/app/utils/api.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void loginNow() async {
  final response = await _getConnect.post(BaseUrl.login, {
    'email': emailController.text,
    'password': passwordController.text,
  });

  if (response.statusCode == 200) {
    authToken.write('access_token', response.body['access_token']);
    Get.offAll(() => const DashboardView());
  } else {
    // AMANKAN bagian ini dari kemungkinan null
    final errorMessage = response.body != null && response.body is Map
        ? response.body['error']?.toString() ?? 'Unknown error'
        : 'Terjadi kesalahan koneksi ke server.';

    Get.snackbar(
      'Error',
      errorMessage,
      icon: const Icon(Icons.error),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      forwardAnimationCurve: Curves.bounceIn,
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
    );
  }
}


  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
