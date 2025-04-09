import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jabatan_controller.dart';

class JabatanView extends GetView<JabatanController> {
  const JabatanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JabatanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JabatanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
