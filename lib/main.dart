import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:maps_1/screen/home/view/map_screen.dart';
import 'package:maps_1/screen/home/view/map_view.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => Track_Screen(),
        'MapScreen': (p0) => Map_Screen(),
      },
    ),
  );
}