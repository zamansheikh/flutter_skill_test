import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFF0A8ED9);

  static const Color textColor = Color(0xFFFFFFFF);


  //Home Page
  static const Color searchBarBackgroundColor = Color(0xFFF7F7F7);
  static const Color locationIconBackground = Color.fromRGBO(0, 0, 0, 0.24);
  // Gradients
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6200EE), Color(0xFF03DAC6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient blueOceanLinearGradient = LinearGradient(
    colors: [Color(0xFFA0DAFB), Color(0xFF0A8ED9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
