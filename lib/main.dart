import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_1/screen/home/view/map_screen.dart';
import 'package:maps_1/screen/home/view/map_view.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => DataScreen(),
        'map':(context) => HomeScreen(),
      },
    ),
  );
}