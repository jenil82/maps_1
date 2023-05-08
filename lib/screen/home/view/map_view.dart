import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../conytoller/map_conytoller.dart';

class Track_Screen extends StatefulWidget {
  const Track_Screen({Key? key}) : super(key: key);

  @override
  State<Track_Screen> createState() => _Track_ScreenState();
}

class _Track_ScreenState extends State<Track_Screen> {
  Trackcontroller trackcontroller = Get.put(Trackcontroller());

  void initState() {
    // TODO: implement initState
    super.initState();
    trackcontroller.permission();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Live location",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var Status = await Permission.location.status;
                    if (Status.isDenied) {
                      await Permission.location.request();
                    }
                  },
                  child: Text("Permision"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);

                      trackcontroller.lat.value = position.latitude;
                      trackcontroller.lan.value = position.longitude;
                    },
                    child: Text("locketed")),
                Obx(
                      () => Text("lat = ${trackcontroller.lat}"),
                ),
                Obx(
                      () => Text("lan = ${trackcontroller.lan}"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                      trackcontroller.lat.value,
                      trackcontroller.lan.value,
                    );
                    trackcontroller.plceList.value = placemarks;
                  },
                  child: Text("Adderss"),
                ),
                Obx(
                      () => Container(
                    child: Text(trackcontroller.plceList.value.isEmpty
                        ? " "
                        : "${trackcontroller.plceList[0]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 40,),
                FloatingActionButton.extended(
                  onPressed: () {
                    Get.toNamed('MapScreen');
                  },
                  label: Text("loacation"),

                  icon: Icon(Icons.location_on_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}