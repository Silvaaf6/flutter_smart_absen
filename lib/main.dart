import 'dart:io'; // Import untuk HttpOverrides
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';

// Kelas MyHttpOverrides untuk mengabaikan pengecekan SSL
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Mengonfigurasi HttpOverrides global agar mengabaikan pengecekan sertifikat SSL
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Absen",
      theme: ThemeData(
      textTheme: GoogleFonts.cabinTextTheme(),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.cabinTextTheme(ThemeData.dark().textTheme),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
    ),
  );
}
