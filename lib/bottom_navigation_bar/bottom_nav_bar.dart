import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_sctreaming/home_page/home_page.dart';
import 'package:movie_sctreaming/favourite_page/favourite_page.dart';
import 'package:movie_sctreaming/profile_page/profile_page.dart';
import 'package:movie_sctreaming/search_page/search_page.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const SearchPage(),
    const FavouritePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () async {

            },
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Icon(Icons.play_arrow, size: 30, color: Colors.white),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        elevation: 0,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: const Offset(-15, 0),
              child: const Icon(Icons.grid_view_rounded),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: const Offset(-30, 0),
              child: const Icon(Icons.search),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: const Offset(30, 0),
              child: const Icon(Icons.favorite),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: const Offset(15, 0),
              child: const Icon(Icons.person_rounded),
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
    );
  }
}
