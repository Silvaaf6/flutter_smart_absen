import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:smart_absen/app/data/profile_response.dart';
import 'dart:convert';

class ProfileController extends GetxController {
  RxBool isLoading = true.obs;
  Rxn<ProfileResponse> profileResponse = Rxn<ProfileResponse>();
  final token = GetStorage().read('token');

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/profile'),
        headers: {
          'Authorization': 'Bearer 470|ATf3A2vFDDcQ9cKd1RyAgdGvzQMtOrLvZuDyTH2lcdaba3f3',
          'Accept': 'application/json', 
        },
      );

      if (response.statusCode == 200) {
        profileResponse.value =
            ProfileResponse.fromJson(json.decode(response.body));
      } else {
        Get.snackbar("Error", "Gagal mengambil data profil");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}
