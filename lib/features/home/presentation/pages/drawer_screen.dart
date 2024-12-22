import 'package:flutter/material.dart';
import 'package:flutter_skill_test/core/utils/app_colors.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/drawer_item.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerItem(
              isSelected: selectedIndex == 0,
              itemName: "Home",
              icon: Icons.home,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            DrawerItem(
              isSelected: selectedIndex == 1,
              itemName: "Profile",
              icon: Icons.person,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            DrawerItem(
              isSelected: selectedIndex == 2,
              itemName: "Nearby",
              icon: Icons.location_on,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
            const Divider(
              color: Colors.white,
              thickness: 1.0,
              endIndent: 180,
            ),
            DrawerItem(
              isSelected: selectedIndex == 3,
              itemName: "Bookmark",
              icon: Icons.bookmark,
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
            ),
            DrawerItem(
              isSelected: selectedIndex == 4,
              itemName: "Notification",
              icon: Icons.notifications,
              onTap: () {
                setState(() {
                  selectedIndex = 4;
                });
              },
            ),
            DrawerItem(
              isSelected: selectedIndex == 5,
              itemName: "Message",
              icon: Icons.quickreply_rounded,
              onTap: () {
                setState(() {
                  selectedIndex = 5;
                });
              },
            ),
            const Divider(
              color: Colors.white,
              thickness: 1.0,
              endIndent: 180,
            ),
            DrawerItem(
              isSelected: selectedIndex == 6,
              itemName: "Settings",
              icon: Icons.settings,
              onTap: () {
                setState(() {
                  selectedIndex = 6;
                });
              },
            ),
            DrawerItem(
              isSelected: selectedIndex == 7,
              itemName: "Help",
              icon: Icons.help,
              onTap: () {
                setState(() {
                  selectedIndex = 7;
                });
              },
            ),
            DrawerItem(
              isSelected: selectedIndex == 8,
              itemName: "Logout",
              icon: Icons.power_settings_new,
              onTap: () {
                setState(() {
                  selectedIndex = 8;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
