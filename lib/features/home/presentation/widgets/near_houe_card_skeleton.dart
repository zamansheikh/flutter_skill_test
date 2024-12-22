import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NearHouseCardSkeleton extends StatelessWidget {
  const NearHouseCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 222,
        height: 272,
        decoration: BoxDecoration(
          color: Colors.grey[300], // Base color for the skeleton
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Skeleton for location badge
            Positioned(
              top: 20,
              right: 16,
              child: Container(
                width: 60,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Skeleton for bottom title and address
            Positioned(
              bottom: 16,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Skeleton for title
                  Container(
                    height: 16,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Skeleton for address
                  Container(
                    height: 12,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
