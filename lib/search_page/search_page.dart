import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/genre_model.dart';

import '../home_page/movie_horizontal_list.dart';
import '../models/media_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Set<String> _selectedGenres = {};

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).dividerColor,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).dialogBackgroundColor,
                      size: 30,
                    ),
                    hintText: 'Пошук',
                    hintStyle: Theme.of(context).textTheme.titleSmall,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                Container(
                  height: 50,
                  width: screenSize.width,
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieGenres.length,
                    itemBuilder: (BuildContext context, int index) {
                      final genre = movieGenres[index];
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
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Text(
                          'В тренді',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),

          MovieHorizontalList(movies: movies),

        ],
      ),
    );
  }
}
