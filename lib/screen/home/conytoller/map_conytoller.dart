import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Trackcontroller extends GetxController {
  RxDouble lan = 0.0.obs;
  RxDouble lat = 0.0.obs;

  RxList<Placemark> plceList = <Placemark>[].obs;

  Future<void> permission() async {
    {
      var Status = await Permission.location.status;
      if (Status.isDenied) {
        await Permission.location.request();
      }
    }
  }
}