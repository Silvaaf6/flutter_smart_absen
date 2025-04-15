import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_absen/app/data/kehadiran_response.dart'; // Pastikan model KehadiranResponse sesuai
class KehadiranController extends GetxController {
  var isLoading = true.obs;
  var kehadiranList = <Data>[].obs; // Data yang akan menampung list Data
  

  @override
  void onInit() {
    fetchKehadiran(); // Memanggil fungsi untuk fetch data kehadiran
    super.onInit();
  }

  void fetchKehadiran() async {
    try {
      isLoading(true);

      var response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/kehadiran'),
        headers: {
          "Accept": "application/json",
          "Authorization":
              "Bearer 537|vH3SB24MXsVvNgK5JxtoYS3ROBsCO8Ig89ZvVypz653d72ed",
        },
      );

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
