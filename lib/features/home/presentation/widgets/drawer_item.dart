import 'package:flutter/material.dart';
import 'package:flutter_skill_test/core/utils/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final bool isSelected;
  final String itemName;
  final IconData icon;
  final VoidCallback onTap; // Callback for tap event

  const DrawerItem({
    super.key,
    required this.isSelected,
    required this.itemName,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Trigger the callback
      splashColor: AppColors.backgroundColor.withValues(
        red: 255,
        green: 255,
        blue: 255,
        alpha: 0.3,
      ),
      child: Container(
        height: 40,
        width: 180,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.backgroundColor : Colors.white,
              ),
              const SizedBox(width: 8), // Add spacing between icon and text
              Text(
                itemName,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? AppColors.backgroundColor : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
