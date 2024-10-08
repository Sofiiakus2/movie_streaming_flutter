import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_sctreaming/autorization/auth_service.dart';
import 'package:movie_sctreaming/film_serial_pages/film_page/film_player/film_player_page.dart';
import 'package:movie_sctreaming/film_serial_pages/serial_page/serial_player/serial_player_page.dart';
import 'package:movie_sctreaming/home_page/home_page.dart';
import 'package:movie_sctreaming/favourite_page/favourite_page.dart';
import 'package:movie_sctreaming/models/season_model.dart';
import 'package:movie_sctreaming/models/series_model.dart';
import 'package:movie_sctreaming/profile_page/profile_page.dart';
import 'package:movie_sctreaming/search_page/search_page.dart';
import '../models/media_model.dart';



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
              MediaModel? media = await AuthService.getMediaModel();
              if (media != null) {
                if (media.mediaType == 'movie') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FilmPlayerPage(film: media);
                    },
                  );
                }
              } else{
                SeasonModel? season = await AuthService.getSerialSeason();
                SeriesModel? seria = await AuthService.getSerialSeria();
                if (season != null && seria != null){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SerialPlayerPage(season: season, seria: seria);
                    },
                  );
                }
              }
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
