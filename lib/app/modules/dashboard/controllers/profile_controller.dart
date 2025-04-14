import 'dart:convert';
import 'package:smart_absen/app/data/profile_response.dart';
import 'package:get/get.dart';
import '../../../utils/api.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var profile = <Data>[].obs;
  var isLoading = false.obs;

  final String token = '346|a3uVwd2DDI6TcZdxF9DkjRE9GuBmmY0Hg2x8vFC7d730f58f';

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

 void fetchProfile() async {
  try {
    isLoading.value = true;

    final response = await http.get(
        Uri.parse(BaseUrl.profile),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token', // kalau pakai sanctum/passport
        },
      );

    // Tambahkan print untuk debug
    print('Response Body: ${response.body}');  // Debugging response body

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final profileResponse = ProfileResponse.fromJson(jsonResponse);

      if (profileResponse.data != null) {
        profile.value = profileResponse.data!;
      } else {
        profile.clear();
        Get.snackbar('Info', 'Data profil kosong');
      }
    } else {
      Get.snackbar('Error', 'Gagal memuat data profil (${response.statusCode})');
    }
  } catch (e) {
    Get.snackbar('Error', 'Terjadi kesalahan: $e');
  } finally {
    isLoading.value = false;
  }
}

}
