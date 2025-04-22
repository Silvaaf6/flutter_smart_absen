import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_absen/app/data/kehadiran_response.dart'; 
class KehadiranController extends GetxController {
  var isLoading = true.obs;
  var kehadiranList = <Data>[].obs; 
  

  @override
  void onInit() {
    fetchKehadiran(); 
    super.onInit();
  }

  void fetchKehadiran() async {
    try {
      isLoading(true);

      var response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/kehadiran'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          "Authorization":
              "Bearer 1|50ZUfaSdhuPbU1nHW8FPdKSjkIxV2NknN92PfMSk95e4acb8",
        },
      );
      print(response.body); 
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        var parsed = KehadiranResponse.fromJson(jsonData);

        // Kalau mau misalnya hanya ambil yang punya jam kerja valid
        // kehadiranList.value = parsed.data?.where((d) => d.jamKerja != null)?.toList() ?? [];

        kehadiranList.value = parsed.data ?? [];
      } else {
        Get.snackbar("Error", "Gagal mengambil data kehadiran");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

}
