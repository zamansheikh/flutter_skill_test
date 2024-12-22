import 'package:flutter/material.dart';
import 'package:flutter_skill_test/features/home/presentation/pages/drawer_screen.dart';
import 'package:flutter_skill_test/features/home/presentation/pages/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
