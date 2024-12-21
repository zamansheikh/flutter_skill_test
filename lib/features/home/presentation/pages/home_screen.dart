import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
          color: Colors.white,
        ),
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(isDrawerOpen ? Icons.arrow_back : Icons.menu),
                  onPressed: () {
                    setState(() {
                      isDrawerOpen = !isDrawerOpen;
                    });
                  },
                ),
                const Text('Home'),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  Text('Home Screen'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
