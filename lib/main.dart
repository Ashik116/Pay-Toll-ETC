import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toll_payetc/Animation/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay TOLL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splashscreen(),
    );
  }
}

// Route Splashscreen()
