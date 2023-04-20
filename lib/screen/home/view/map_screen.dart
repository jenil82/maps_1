import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../conytoller/map_conytoller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _completer = Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(21.233422, 72.907526),
    zoom: 16.4749,
  );

  List<Marker> _marker = [];
  List<Marker> list = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(21.233422, 72.907526),
    ),
  ];

  LocationController locationController = Get.put(LocationController());

  @override
  void initState() {
    super.initState();
    _marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            " MAP Location",
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _completer.complete(controller);
          },
        ),
      ),
    );
  }
}