import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_clone/views/pages/HomeScreen.dart';
import 'package:netflix_clone/views/pages/download.dart';
import 'package:netflix_clone/views/pages/searchscreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedindex = 0;
  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const DownloadScreen()
  ];

  pagechanger(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedindex,
        onDestinationSelected: pagechanger,
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Iconsax.search_favorite), label: 'Search'),
          NavigationDestination(icon: Icon(Iconsax.trend_up), label: 'New&Hot')
        ],
      ),
      body: pages[selectedindex],
    );
  }
}
