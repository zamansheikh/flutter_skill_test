import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class MapsController extends GetxController {
  final String placeName;
  MapsController(this.placeName);
  Rxn<LatLng> locationOfThisPlace = Rxn<LatLng>();

  @override
  void onInit() {
    super.onInit();
    getLocationByName(placeName);
  }

  Future<void> getLocationByName(String placeName) async {
    try {
      List<Location> locations = await locationFromAddress(placeName);
      if (locations.isNotEmpty) {
        final location = locations.first;
        locationOfThisPlace.value =
            LatLng(location.latitude, location.longitude);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching location: $e');
      locationOfThisPlace.value = LatLng(23.777176, 90.399452);
    }
  }
}
