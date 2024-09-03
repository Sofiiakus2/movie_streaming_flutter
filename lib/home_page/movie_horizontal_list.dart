
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/film_serial_pages/film_page/film_page.dart';

import '../film_serial_pages/serial_page/serial_page.dart';
import '../models/media_model.dart';

class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({
    super.key,
    required this.fetchMovies,
  });

  final Future<List<MediaModel>> fetchMovies;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MediaModel>>(
      future: fetchMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No movies found.'));
        }
        final allMovies = snapshot.data!;
        return SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allMovies.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  if (allMovies[index].media_type == "movie") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilmPage(film: allMovies[index],)),
                    );
                  }
                  else if (allMovies[index].media_type == "series") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SerialPage(serial: allMovies[index],)),
                    );
                  }
                },

                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 199,
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(allMovies[index].poster_path),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Text(
                        allMovies[index].title,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
