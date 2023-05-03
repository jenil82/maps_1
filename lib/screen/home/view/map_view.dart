import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../conytoller/map_conytoller.dart';

class maps_screen extends StatefulWidget {
  const maps_screen({Key? key}) : super(key: key);

  @override
  State<maps_screen> createState() => _maps_screenState();
}

class _maps_screenState extends State<maps_screen> {
  Trackcontroller trac = Get.put(Trackcontroller());

  void initState() {
    // TODO: implement initState
    super.initState();
    trac.permission();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Live map",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () async {
                    var Status = await Permission.location.status;
                    if (Status.isDenied) {
                      await Permission.location.request();
                    }
                  },
                  child: Text("Permision"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);

                      trac.lat.value = position.latitude;
                      trac.lan.value = position.longitude;
                    },
                    child: Text("locketed")),
                Obx(
                      () => Text("lat = ${trac.lat}"),
                ),
                Obx(
                      () => Text("lan = ${trac.lan}"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                      trac.lat.value,
                      trac.lan.value,
                    );
                    trac.plceList.value = placemarks;
                  },
                  child: Text("Adderss"),
                ),
                Obx(
                      () => Container(
                    child: Text(trac.plceList.value.isEmpty
                        ? " "
                        : "${trac.plceList[0]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ),
                SizedBox(height: 40,),
                FloatingActionButton.extended(
                  onPressed: () {
                    Get.toNamed('MapScreen');
                  },
                  label:  Icon(Icons.location_on_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}