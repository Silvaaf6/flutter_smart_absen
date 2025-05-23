import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/jabatan_response.dart';
import '../../../utils/api.dart';

class JabatanController extends GetxController {
  var isLoading = false.obs;
  var jabatanList = <Data>[].obs;

  // TODO: Ganti token ini sesuai dengan yang kamu miliki
  final String token = '1|50ZUfaSdhuPbU1nHW8FPdKSjkIxV2NknN92PfMSk95e4acb8';

  @override
  void onInit() {
    super.onInit();
    fetchJabatanData();
  }

  Future<void> fetchJabatanData() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse(BaseUrl.jabatan),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('RESPONSE: ${response.body}');

      if (response.statusCode == 200) {
        final jabatanResponse = JabatanResponse.fromJson(json.decode(response.body));

        if (jabatanResponse.data != null) {
          jabatanList.value = jabatanResponse.data!;
        } else {
          jabatanList.clear();
          Get.snackbar('Info', 'Tidak ada data jabatan tersedia');
        }
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data jabatan. Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
