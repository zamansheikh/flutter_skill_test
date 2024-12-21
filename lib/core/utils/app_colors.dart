import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFF0A8ED9);

  static const Color textColor = Color(0xFFFFFFFF);

  // Gradients
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6200EE), Color(0xFF03DAC6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
