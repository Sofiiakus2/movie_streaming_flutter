
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../film_serial_pages/film_page/film_page.dart';
import '../film_serial_pages/serial_page/serial_page.dart';
import '../models/media_model.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({
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
        return Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.5,
              ),
              itemCount: allMovies.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                );
              }
          ),
        );
      }
    );
  }
}
