import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:music_app/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
      title: 'Beats',
      theme: ThemeData(
        fontFamily: "regular",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
