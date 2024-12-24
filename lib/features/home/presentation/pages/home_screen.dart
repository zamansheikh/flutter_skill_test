import 'package:flutter/material.dart';
import 'package:flutter_skill_test/core/routes/route_names.dart';
import 'package:flutter_skill_test/core/utils/app_colors.dart';
import 'package:flutter_skill_test/core/utils/utils.dart';
import 'package:flutter_skill_test/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/best_house_card.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/best_house_card_skeleton.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/category_button.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/custom_section.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/near_houe_card.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/near_houe_card_skeleton.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;
  final HomeController controller = Get.find();
  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // Swiping in right direction
      setState(() {
        isDrawerOpen = true;
        FocusScope.of(context).unfocus();
      });
    } else if (details.delta.dx < 0) {
      // Swiping in left direction
      setState(() {
        isDrawerOpen = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double xOffset = isDrawerOpen ? screenWidth * 0.60 : 0;
    double yOffset = isDrawerOpen ? screenHeight * 0.12 : 0;
    double scaleFactor = isDrawerOpen ? 0.8 : 1;

    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
          color: Colors.white,
        ),
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              //Start of the app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location"),
                        GestureDetector(
                          onTap: () {
                            showToast("Not implemented yet");
                          },
                          child: Row(
                            children: [
                              Text(
                                "Jakarta",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.notification_important_outlined),
                      onPressed: () {
                        showToast("Not implemented yet");
                      },
                    ),
                  ],
                ),
              ),
              //Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.searchBarBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                onChanged: (value) =>
                                    controller.setSearchQuery(value),
                                enabled: isDrawerOpen ? false : true,
                                decoration: InputDecoration(
                                  hintText: "Search address, or near you",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showToast("Filter options coming soon!"),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: AppColors.blueOceanLinearGradient,
                        ),
                        child: Icon(Icons.tune, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              // Categories
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryButton(
                          label: "All",
                          isSelected: controller.selectedCategory.value.isEmpty,
                          onTap: () => controller.setCategory(''),
                        ),
                        CategoryButton(
                          label: "House",
                          isSelected:
                              controller.selectedCategory.value == "House",
                          onTap: () => controller.setCategory('House'),
                        ),
                        CategoryButton(
                          label: "Apartment",
                          isSelected:
                              controller.selectedCategory.value == "Apartment",
                          onTap: () => controller.setCategory('Apartment'),
                        ),
                        CategoryButton(
                          label: "Villa",
                          isSelected:
                              controller.selectedCategory.value == "Villa",
                          onTap: () => controller.setCategory('Villa'),
                        ),
                        CategoryButton(
                          label: "Condo",
                          isSelected:
                              controller.selectedCategory.value == "Condo",
                          onTap: () => controller.setCategory('Condo'),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              // Near from you section
              const SizedBox(height: 27),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomSection(
                    onTap: () {
                      showToast("Not implemented yet");
                    },
                    title: "Near from you"),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () {
                    if (controller.isLoading.value) {
                      return Row(spacing: 24, children: [
                        SizedBox(),
                        ...List.generate(
                          3,
                          (index) => const NearHouseCardSkeleton(),
                        ),
                      ]);
                    }
                    return Row(spacing: 24, children: [
                      SizedBox(),
                      ...List.generate(
                        controller.filteredHouses.length,
                        (index) => NearHouseCard(
                          onTap: () {
                            Get.toNamed(RouteNames.houseDetails,
                                arguments: controller.filteredHouses[index]);
                          },
                          title: controller.filteredHouses[index].name,
                          address: controller.filteredHouses[index].address,
                          distance:
                              "${controller.filteredHouses[index].distance.toStringAsFixed(0)} KM",
                          imageUrl: controller.filteredHouses[index].imageUrl,
                        ),
                      ),
                    ]);
                  },
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomSection(
                    onTap: () {
                      showToast("Not implemented yet");
                    },
                    title: "Best for you"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: const [
                              BestHouseCardSkeleton(),
                              SizedBox(height: 16),
                            ],
                          );
                        },
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.filteredHouses.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            BestHouseCard(
                              onTap: () {
                                Get.toNamed(RouteNames.houseDetails,
                                    arguments:
                                        controller.filteredHouses[index]);
                              },
                              title: controller.filteredHouses[index].name,
                              price:
                                  "Rp. ${controller.filteredHouses[index].price}/Year",
                              bedrooms:
                                  controller.filteredHouses[index].bedrooms,
                              bathrooms:
                                  controller.filteredHouses[index].bathrooms,
                              imageUrl:
                                  controller.filteredHouses[index].imageUrl,
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
