import 'package:flutter/material.dart';
import 'package:flutter_skill_test/core/utils/app_colors.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/best_house_card.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/category_button.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/custom_section.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/near_houe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // Swiping in right direction
      setState(() {
        isDrawerOpen = true;
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
        height: MediaQuery.of(context).size.height, // Add constraints
        width: MediaQuery.of(context).size.width, // Add constraints
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
                        Text(
                          "Jakarta",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.notification_important_outlined),
                      onPressed: () {
                        setState(() {
                          print("Notification button pressed");
                        });
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
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: AppColors.blueOceanLinearGradient,
                      ),
                      child: Icon(Icons.tune, color: Colors.white),
                    ),
                  ],
                ),
              ),
              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryButton(label: "House", isSelected: true),
                      CategoryButton(label: "Apartment"),
                      CategoryButton(label: "Hotel"),
                      CategoryButton(label: "Villa"),
                      CategoryButton(label: "Condo"),
                    ],
                  ),
                ),
              ),
              // Near from you section
              const SizedBox(height: 27),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomSection(onTap: () {}, title: "Near from you"),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 24,
                  children: [
                    const SizedBox(),
                    NearHouseCard(
                      imageUrl:
                          "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
                      title: "Dreamsville House",
                      address: "Jl. Sultan Iskandar Muda",
                      distance: "1.8 KM",
                    ),
                    NearHouseCard(
                      imageUrl:
                          "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
                      title: "Dreamsville House",
                      address: "Jl. Sultan Iskandar Muda",
                      distance: "1.8 KM",
                    ),
                    NearHouseCard(
                      imageUrl:
                          "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
                      title: "Dreamsville House",
                      address: "Jl. Sultan Iskandar Muda",
                      distance: "1.8 KM",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomSection(onTap: () {}, title: "Best for you"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 24,
                    children: [
                      BestHouseCard(
                        title: "Orchad House",
                        price: "Rp. 2.500.000.000 / Year",
                        bedrooms: 4,
                        bathrooms: 4,
                        imageUrl:
                            "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
                      ),
                      BestHouseCard(
                        title: "Orchad House",
                        price: "Rp. 2.500.000.000 / Year",
                        bedrooms: 4,
                        bathrooms: 4,
                        imageUrl:
                            "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
                      ),
                      BestHouseCard(
                        title: "Orchad House",
                        price: "Rp. 2.500.000.000 / Year",
                        bedrooms: 4,
                        bathrooms: 4,
                        imageUrl:
                            "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
                      ),
                      BestHouseCard(
                        title: "Orchad House",
                        price: "Rp. 2.500.000.000 / Year",
                        bedrooms: 4,
                        bathrooms: 4,
                        imageUrl:
                            "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
                      ),
                      BestHouseCard(
                        title: "Orchad House",
                        price: "Rp. 2.500.000.000 / Year",
                        bedrooms: 4,
                        bathrooms: 4,
                        imageUrl:
                            "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
