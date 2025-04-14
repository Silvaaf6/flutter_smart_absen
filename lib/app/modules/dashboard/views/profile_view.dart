import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Saya"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final profile = controller.profileResponse.value?.data?.first;
        if (profile == null) {
          return Center(child: Text("Data profil tidak tersedia"));
        }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 233, 245, 255)!, Color.fromARGB(255, 168, 215, 255)!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Center(
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                              profile.cover ??
                                  'https://via.placeholder.com/150',
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "${profile.name}",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email: ${profile.email}"),
                          ),
                          ListTile(
                            leading: Icon(Icons.assignment),
                            title: Text("NIP: ${profile.nip}"),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text("Tempat Lahir: ${profile.tempatLahir}"),
                          ),
                          ListTile(
                            leading: Icon(Icons.calendar_today),
                            title: Text("Tanggal Lahir: ${profile.tglLahir}"),
                          ),
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text("Alamat: ${profile.alamat}"),
                          ),
                          ListTile(
                            leading: Icon(Icons.wc),
                            title:
                                Text("Jenis Kelamin: ${profile.jenisKelamin}"),
                          ),
                          ListTile(
                            leading: Icon(Icons.mood),
                            title: Text("Agama: ${profile.agama}"),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("No. Telp: ${profile.noTelp}"),
                          ),
                          ListTile(
                            leading: Icon(Icons.work),
                            title: Text(
                                "Jabatan: ${profile.jabatan?.namaJabatan ?? '-'}"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
