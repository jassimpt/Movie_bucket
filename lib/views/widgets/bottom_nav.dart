import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_clone/views/pages/Home_Screen.dart';
import 'package:netflix_clone/views/pages/movies_screen.dart';
import 'package:netflix_clone/views/pages/search_screen.dart';
import 'package:netflix_clone/views/pages/tvshows_scree.dart';

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
    const TvShowsScreen(),
    const MovieScreen()
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
        indicatorColor: Colors.black.withOpacity(0.4),
        selectedIndex: selectedindex,
        onDestinationSelected: pagechanger,
        destinations: [
          const NavigationDestination(
            icon: Icon(Iconsax.home, color: Colors.white),
            label: 'Home',
          ),
          const NavigationDestination(
              icon: Icon(Iconsax.search_favorite, color: Colors.white),
              label: 'Search'),
          NavigationDestination(
              icon: Image.asset(
                'assets/images/tv.png',
                height: 30,
                width: 30,
              ),
              label: 'Tv shows'),
          NavigationDestination(
              icon: Image.asset(
                'assets/images/movie.png',
                height: 30,
                width: 30,
              ),
              label: 'Movies')
        ],
      ),
      body: pages[selectedindex],
    );
  }
}
