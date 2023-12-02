import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_clone/controller/bottom_provider.dart';
import 'package:netflix_clone/views/pages/Home_Screen.dart';
import 'package:netflix_clone/views/pages/movies_screen.dart';
import 'package:netflix_clone/views/pages/search_screen.dart';
import 'package:netflix_clone/views/pages/tvshows_scree.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      const SearchScreen(),
      const TvShowsScreen(),
      const MovieScreen()
    ];
    final bottomProvider = Provider.of<BottomProvider>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.black.withOpacity(0.4),
        selectedIndex: bottomProvider.selectedindex,
        onDestinationSelected: (int index) => bottomProvider.pagechanger(index),
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
      body: pages[Provider.of<BottomProvider>(context).selectedindex],
    );
  }
}
