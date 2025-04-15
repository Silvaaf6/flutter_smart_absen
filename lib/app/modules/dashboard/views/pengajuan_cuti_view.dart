import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_absen/app/modules/dashboard/controllers/pengajuan_cuti_controller.dart';

class PengajuanCutiView extends StatelessWidget {
  final PengajuanCutiController controller = Get.put(PengajuanCutiController());

  final List<String> kategoriCutiList = ['Izin', 'Cuti'];

  // Format tanggal
  String formatDate(String? dateString) {
    if (dateString == null) return '-';
    try {
      final DateTime date = DateTime.parse(dateString);
      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }

  // Warna status
  Color getStatusColor(String? status) {
    if (status == null) return Colors.grey;

    switch (status.toLowerCase()) {
      case 'disetujui':
        return Colors.green;
      case 'ditolak':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  void _showTambahPengajuanCutiModal(BuildContext context) {
    String selectedKategori = kategoriCutiList.first;

    final TextEditingController tglMulaiController = TextEditingController();
    final TextEditingController tglSelesaiController = TextEditingController();
    final TextEditingController alasanController = TextEditingController();

    Future<void> _selectDate(
        BuildContext context, TextEditingController controller) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Pengajuan Cuti'),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kategori Cuti'),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: selectedKategori,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          selectedKategori = newValue;
                        }
                      },
                      isExpanded: true,
                      underline: SizedBox(),
                      items: kategoriCutiList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Tanggal Mulai'),
                  SizedBox(height: 6),
                  TextField(
                    controller: tglMulaiController,
                    readOnly: true,
                    onTap: () => _selectDate(context, tglMulaiController),
                    decoration: InputDecoration(
                      hintText: 'Pilih tanggal mulai',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Tanggal Selesai'),
                  SizedBox(height: 6),
                  TextField(
                    controller: tglSelesaiController,
                    readOnly: true,
                    onTap: () => _selectDate(context, tglSelesaiController),
                    decoration: InputDecoration(
                      hintText: 'Pilih tanggal selesai',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Alasan'),
                  SizedBox(height: 6),
                  TextField(
                    controller: alasanController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Masukkan alasan cuti',
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Tambahkan logika pengajuan cuti ke controller
                Navigator.pop(context);
              },
              child: Text('Ajukan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.refreshData(),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.error.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red),
                SizedBox(height: 16),
                Text(
                  controller.error.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.refreshData(),
                  child: Text('Coba Lagi'),
                )
              ],
            ),
          );
        }

        if (controller.pengajuanCutiResponse.value.data == null ||
            controller.pengajuanCutiResponse.value.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hourglass_empty, size: 48, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Tidak ada pengajuan cuti.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.pengajuanCutiResponse.value.data!.length,
          itemBuilder: (context, index) {
            var data = controller.pengajuanCutiResponse.value.data![index];
            return Card(
              elevation: 3,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pengajuan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: getStatusColor(data.status),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            data.status ?? 'Pending',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildInfoRow('Kategori', data.kategoriCuti ?? '-'),
                    _buildInfoRow(
                        'Tanggal Pengajuan', formatDate(data.tglPengajuan)),
                    _buildInfoRow('Periode',
                        '${formatDate(data.tglMulai)} - ${formatDate(data.tglSelesai)}'),
                    _buildInfoRow('Alasan', data.alasan ?? '-'),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTambahPengajuanCutiModal(context);
        },
        child: Icon(Icons.add),
        tooltip: 'Ajukan Cuti',
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
