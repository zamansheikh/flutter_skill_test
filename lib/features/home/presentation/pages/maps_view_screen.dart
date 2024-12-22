import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import '../controllers/maps_controller.dart';

class MapsViewScreen extends StatelessWidget {
  final String placeName;

  const MapsViewScreen({super.key, required this.placeName});

  @override
  Widget build(BuildContext context) {
    final MapsController controller = Get.put(MapsController(placeName));

    return Scaffold(
      body: Obx(() {
        if (controller.locationOfThisPlace.value == null) {
          return const Center(
              child: CircularProgressIndicator()); // Loading indicator
        }
        return FlutterMap(
          options: MapOptions(
            initialCenter: controller.locationOfThisPlace.value!,
            initialZoom: 13.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            ),
            MarkerLayer(
              markers: [
                // Location marker
                Marker(
                  point: controller.locationOfThisPlace.value!,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
