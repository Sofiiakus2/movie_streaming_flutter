
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_sctreaming/film_serial_pages/film_page/film_page.dart';

import '../models/media_model.dart';

class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({
    super.key,
    required this.movies,
  });

  final List<MediaModel> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
     // margin: const EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (movies[index].media_type == "movie") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilmPage(film: movies[index],)),
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
                        image: NetworkImage(movies[index].poster_path), // Використання URL з вашого моделі
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Text(
                    movies[index].title,
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
}
