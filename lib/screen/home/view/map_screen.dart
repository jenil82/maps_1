import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../conytoller/map_conytoller.dart';

class Map_Screen extends StatefulWidget {
  const Map_Screen({Key? key}) : super(key: key);

  @override
  State<Map_Screen> createState() => _Map_ScreenState();
}

class _Map_ScreenState extends State<Map_Screen> {
  Trackcontroller trackcontroller = Get.put(Trackcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.black,
              centerTitle: true,
              // leading: Icon(Icons.search),
              // actions: [Icon(Icons.settings)],
              title: const Text(
                "Google Map",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  trackcontroller.lat.value,
                  trackcontroller.lan.value,
                ),
              ),
              markers: {
                Marker(
                  draggable: true,
                  markerId: MarkerId("not Available"),
                  position: LatLng(
                      trackcontroller.lat.value, trackcontroller.lan.value),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
