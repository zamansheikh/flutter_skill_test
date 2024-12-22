import 'package:flutter/material.dart';

class CustomSection extends StatelessWidget {
  final VoidCallback onTap;
  final String title; 
  const CustomSection({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text(
            "See more",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
