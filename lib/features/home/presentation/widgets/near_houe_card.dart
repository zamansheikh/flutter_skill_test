import 'package:flutter/material.dart';
import 'package:flutter_skill_test/core/utils/app_colors.dart';

class NearHouseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final String distance;

  const NearHouseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 222,
      height: 272,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.locationIconBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 16,
                  ),
                  Text(
                    distance,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0), // X and Y offsets
                        blurRadius: 4.0, // Blur intensity
                        color: Colors.grey.withValues(
                          red: 0,
                          green: 0,
                          blue: 0,
                          alpha: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0), // X and Y offsets
                        blurRadius: 4.0, // Blur intensity
                        color: Colors.grey.withValues(
                          red: 0,
                          green: 0,
                          blue: 0,
                          alpha: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
