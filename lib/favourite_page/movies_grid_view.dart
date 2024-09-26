
import 'package:flutter/material.dart';

import '../film_serial_pages/film_page/film_page.dart';
import '../film_serial_pages/serial_page/serial_page.dart';
import '../models/media_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          return const SizedBox(height: 500,
              child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return SizedBox(
              height: 500,
              child: Center(child: Text('${AppLocalizations.of(context)!.error}: ${snapshot.error}')));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return  SizedBox(
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.videocam_off_outlined,
                      size: 60,
                      color: Theme.of(context).dialogBackgroundColor,
                    ),
                    const SizedBox(height: 20,),
                    Text(AppLocalizations.of(context)!.noMoviesFound),
                  ],
                ),
          );
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
                    if (allMovies[index].mediaType == "movie") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilmPage(film: allMovies[index],)),
                      );
                    }
                    else if (allMovies[index].mediaType == "series") {
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
                            image: NetworkImage(allMovies[index].posterPath),
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
