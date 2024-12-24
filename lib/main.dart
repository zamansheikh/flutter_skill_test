import 'package:flutter/material.dart';
import 'package:flutter_skill_test/core/routes/route_generator.dart';
import 'package:flutter_skill_test/core/routes/route_names.dart';
import 'package:flutter_skill_test/injection_container.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  Injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IRD Flutter Skill Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // home: HomePage(),
      initialRoute: RouteNames.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
