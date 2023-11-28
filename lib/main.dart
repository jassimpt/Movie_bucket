import 'package:flutter/material.dart';
import 'package:netflix_clone/views/pages/HomeScreen.dart';
import 'package:netflix_clone/views/pages/onboarding.dart';
import 'package:netflix_clone/views/widgets/bottom_nav.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: const ColorScheme.dark()),
      home: OnBoarding(),
    );
  }
}
