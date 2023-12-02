import 'package:flutter/material.dart';
import 'package:netflix_clone/controller/bottom_provider.dart';
import 'package:netflix_clone/controller/search_provider.dart';
import 'package:netflix_clone/controller/showcontroller.dart';
import 'package:netflix_clone/views/pages/Home_Screen.dart';
import 'package:netflix_clone/views/pages/onboarding.dart';
import 'package:netflix_clone/views/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShowController()),
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: const ColorScheme.dark()),
        home: OnBoarding(),
      ),
    );
  }
}
