import 'package:bookly/constants.dart';
import 'package:bookly/core/Features/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Utils().backgroundColor,

      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
