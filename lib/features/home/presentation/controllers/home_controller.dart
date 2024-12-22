import 'package:flutter_skill_test/core/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../domain/entities/house.dart';
import '../../domain/usecases/fetch_all_houses_usecase.dart';

class HomeController extends GetxController {
  final FetchAllHousesUsecase fetchHouse;

  HomeController(this.fetchHouse);

  var houses = <House>[].obs; 
  var isLoading = false.obs; 
  @override
  void onInit() {
    super.onInit();
    fetchHouses(); // Fetch houses when controller is initialized
  }

  Future<void> fetchHouses() async {
    try {
      isLoading.value = true; 
      final result = await fetchHouse(NoParams());
      result.fold(
        (failure) {
          print('Error: $failure');
          isLoading.value = false; // Stop loading on error
        },
        (data) {
          houses.assignAll(data); // Update houses
          isLoading.value = false; // Stop loading on success
        },
      );
    } catch (e) {
      print('Exception: $e');
      isLoading.value = false; // Stop loading on exception
    }
  }
}
