import 'package:flutter/material.dart';
import 'package:movie_sctreaming/favourite_page/movies_grid_view.dart';
import 'package:movie_sctreaming/models/genre_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_sctreaming/services/genre_service.dart';

import '../home_page/movie_horizontal_list.dart';
import '../models/media_model.dart';
import '../services/filters_service.dart';
import '../services/media_service.dart';
import 'filters_dialog.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Set<String> _selectedGenres = {};
  List<String> selectedCountries =  [];
  List<int> selectedYears =  [];
  late Future<List<MediaModel>> _moviesFuture;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _moviesFuture = FiltersService.getMoviesFromDBWithFilters();
  }

  void _onGenreSelected() {
    setState(() {
      _moviesFuture = FiltersService.getMoviesFromDBWithFilters(genres: _selectedGenres, title: searchController.text, countries: selectedCountries, years: selectedYears);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20,),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).dividerColor,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).dialogBackgroundColor,
                        size: 30,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.filter_alt,
                          color: Theme.of(context).dialogBackgroundColor,
                          size: 22,
                        ), onPressed: () async{
                        final result = await showDialog(
                          context: context,
                          builder: (context) {
                            return const FiltersDialog();
                          },
                        );
                        if (result != null) {
                           selectedCountries = result['selectedCountries'] ?? [];
                           selectedYears = result['selectedYears'] ?? [];
                           _onGenreSelected();
                        }
                      },
                      ),
                      hintText: AppLocalizations.of(context)!.search,
                      hintStyle: Theme.of(context).textTheme.titleSmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value){
                      _onGenreSelected();
                    },
                  ),
                ),
                FutureBuilder<List<GenreModel>>(
                  future: GenreService.getGenresFromDB(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Error.'));
                    }
                    final genres = snapshot.data!;
                    return Container(
                      height: 50,
                      width: screenSize.width,
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: genres.length,
                        itemBuilder: (BuildContext context, int index) {
                          final genre = genres[index];
                          final isSelected = _selectedGenres.contains(genre.id);

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedGenres.remove(genre.id);
                                } else {
                                  _selectedGenres.add(genre.id);
                                }
                              });
                              _onGenreSelected();
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
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Center(
                                  child: Text(
                                    genre.name,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Color.alphaBlend( Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor)
                                          : Colors.white54,
                                      fontWeight: isSelected
                                          ? FontWeight.w900
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 15, left: 10),
                //   child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children:[
                //         Text(
                //           AppLocalizations.of(context)!.popular_films,
                //           style: Theme.of(context).textTheme.titleMedium,
                //         ),
                //       ]
                //   ),
                // ),
              ],
            ),
          ),
          MoviesGridView(fetchMovies: _moviesFuture),
       //   MovieHorizontalList(fetchMovies: MediaService.getMoviesFromDB()),

        ],
      ),
    );
  }
}
