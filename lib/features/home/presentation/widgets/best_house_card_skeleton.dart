import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestHouseCardSkeleton extends StatelessWidget {
  const BestHouseCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Skeleton for the image
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Skeleton for the house details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title skeleton
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 16,
                  width: 150,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 8),
              // Price skeleton
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 14,
                  width: 100,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 8),
              // Bedroom and bathroom skeleton
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 14,
                      width: 60,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 14,
                      width: 60,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
