import 'package:get/get.dart';

class Injection {
  static void init() {
    // Data Layer
    // Get.lazyPut<FeatureRepository>(
    //   () => FeatureRepositoryImpl(
    //     // Add your datasource injections here
    //   ),
    // );

    // Domain Layer
    // Get.lazyPut(
    //   () => GetFeature(
    //     Get.find<FeatureRepository>(),
    //   ),
    // );

    // Presentation Layer
    // Get.lazyPut(
    //   () => FeatureController(
    //     getFeature: Get.find(),
    //   ),
    // );
  }
}
