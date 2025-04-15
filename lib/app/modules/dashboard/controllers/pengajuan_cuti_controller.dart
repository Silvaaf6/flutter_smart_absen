// Controller
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Import model response (pastikan path ini sesuai dengan struktur project Anda)
import 'package:smart_absen/app/data/pengajuan_cuti_response.dart';

class PengajuanCutiController extends GetxController {
  var isLoading = true.obs;
  var pengajuanCutiResponse = PengajuanCutiResponse().obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchPengajuanCuti();
    super.onInit();
  }

  // Fungsi untuk mengambil data pengajuan cuti dari API
  Future<void> fetchPengajuanCuti() async {
    try {
      isLoading(true);
      error('');

      var response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/pengajuancuti'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 537|vH3SB24MXsVvNgK5JxtoYS3ROBsCO8Ig89ZvVypz653d72ed',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        pengajuanCutiResponse.value =
            PengajuanCutiResponse.fromJson(jsonResponse);
        print(
            'Data berhasil dimuat: ${pengajuanCutiResponse.value.data?.length ?? 0} item');
      } else {
        error('Gagal memuat data: Status ${response.statusCode}');
        print('Error response: ${response.body}');
      }
    } catch (e) {
      error('Terjadi kesalahan: $e');
      print('Exception: $e');
    } finally {
      isLoading(false);
    }
  }

  // Fungsi untuk refresh data
  void refreshData() {
    fetchPengajuanCuti();
  }
}
