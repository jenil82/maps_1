import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController
{
  RxDouble lat = 0.0.obs;
  RxDouble lan = 0.0.obs;
  RxList<Placemark> add = <Placemark>[].obs;
}