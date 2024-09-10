import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_sctreaming/services/user_service.dart';

import '../models/media_model.dart';
import '../services/media_service.dart';
import 'movies_grid_view.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int _selectedIndex = 0;
  final List<IconData> icons = [Icons.remove_red_eye, Icons.bookmark, Icons.download];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final List<String> types = [AppLocalizations.of(context)!.watched, AppLocalizations.of(context)!.saved];

    Future<List<MediaModel>> fetchMovies() {
      if (_selectedIndex == 0) {
        return MediaService.getMoviesFromDB();
      } else {
        return MediaService.getUserWatchList();
      }
    }

    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.library,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: screenSize.width,
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: types.length,
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = _selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                icons[index],
                                color: isSelected
                                    ? Color.alphaBlend(
                                    Colors.white.withOpacity(0.15),
                                    Theme.of(context).secondaryHeaderColor)
                                    : Colors.white54,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                types[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Color.alphaBlend(
                                      Colors.white.withOpacity(0.15),
                                      Theme.of(context).secondaryHeaderColor)
                                      : Colors.white54,
                                  fontWeight: isSelected
                                      ? FontWeight.w900
                                      : FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    types[_selectedIndex],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),

            MoviesGridView(fetchMovies: fetchMovies()),

          ],
        ),
      ),
    );
  }
}
