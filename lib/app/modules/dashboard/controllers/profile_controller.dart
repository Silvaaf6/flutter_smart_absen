import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:smart_absen/app/data/profile_response.dart';
import 'dart:convert';

class ProfileController extends GetxController {
  RxBool isLoading = true.obs;
  var profile = Rxn<ProfileResponse>();
  final token = GetStorage().read('access_token');

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    print("TOKEN DARI STORAGE: $token");

    try {
      isLoading.value = true;

      if (token == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar("Error", "Token tidak ditemukan, silakan login ulang.");
        });
        return;
      }

      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/profile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        profile.value = ProfileResponse.fromJson(jsonData);
      } else {
        Get.snackbar(
            "Error", "Gagal mengambil data profil (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
