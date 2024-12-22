import 'package:flutter/material.dart';

class BestHouseCard extends StatelessWidget {
  final String title;
  final String price;
  final int bedrooms;
  final int bathrooms;
  final String imageUrl;

  const BestHouseCard({super.key, 
    required this.title,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image of the house
        Container(
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        // House details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.bed, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text("$bedrooms Bedroom"),
                  const SizedBox(width: 16),
                  const Icon(Icons.bathtub, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text("$bathrooms Bathroom"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
