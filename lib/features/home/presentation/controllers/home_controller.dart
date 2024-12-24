import 'package:flutter_skill_test/core/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../domain/entities/house.dart';
import '../../domain/usecases/fetch_all_houses_usecase.dart';

class HomeController extends GetxController {
  final FetchAllHousesUsecase fetchHouse;

  HomeController(this.fetchHouse);

  var houses = <House>[].obs;
  var filteredHouses = <House>[].obs; 
  var isLoading = false.obs;
  var selectedCategory = ''.obs; 
  var searchQuery = ''.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchHouses();
  }

  Future<void> fetchHouses() async {
    try {
      isLoading.value = true;
      final result = await fetchHouse(NoParams());
      result.fold(
        (failure) {
          // ignore: avoid_print
          print('Error: $failure');
          isLoading.value = false;
        },
        (data) {
          houses.assignAll(data);
          filteredHouses.assignAll(data); 
          isLoading.value = false;
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print('Exception: $e');
      isLoading.value = false;
    }
  }

  void filterHouses() {
    List<House> result = houses;

    // Apply category filter
    if (selectedCategory.value.isNotEmpty) {
      result = result
          .where((house) => house.type.toLowerCase() == selectedCategory.value.toLowerCase())
          .toList();
    }

    // Apply search filter
    if (searchQuery.value.isNotEmpty) {
      result = result
          .where((house) => house.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    filteredHouses.assignAll(result);
  }

  // Set selected category and update filtered list
  void setCategory(String category) {
    selectedCategory.value = category;
    filterHouses();
  }

  // Update search query and update filtered list
  void setSearchQuery(String query) {
    searchQuery.value = query;
    filterHouses();
  }
}
