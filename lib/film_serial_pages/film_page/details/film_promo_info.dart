
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/film_serial_pages/film_page/film_player/film_player_page.dart';
import 'package:movie_sctreaming/models/media_model.dart';
import 'package:movie_sctreaming/services/user_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../models/genre_model.dart';


class FilmPromoInfo extends StatefulWidget {
  const FilmPromoInfo({super.key, required this.film,});
  final MediaModel film;

  @override
  State<FilmPromoInfo> createState() => _FilmPromoInfoState();
}

class _FilmPromoInfoState extends State<FilmPromoInfo> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    String formatDuration(String duration) {
      final parts = duration.split(':');
      if (parts.length != 2) {
        return '';
      }

      final hours = int.tryParse(parts[0]) ?? 0;
      final minutes = int.tryParse(parts[1]) ?? 0;

      return '$hours ${AppLocalizations.of(context)!.hours} $minutes ${AppLocalizations.of(context)!.minutes}';
    }

    return  Positioned(
      bottom: 10,
      left: 30,
      right: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenSize.width/1.5,
                child: Text(widget.film.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
              Text(widget.film.age,
                style: TextStyle(
                    fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    color: Theme.of(context).primaryColor
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(GenreModel.getGenreNames(widget.film.genres),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('${widget.film.releaseDate.year}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(formatDuration(widget.film.generalDuration),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            UserService.addToWatchStory(widget.film);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FilmPlayerPage(film: widget.film)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                AppLocalizations.of(context)!.watch,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: FutureBuilder<bool>(
                    future: UserService.isInWatchlist(widget.film.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      bool isInWatchlist = snapshot.data ?? false;
                      return Row(
                        children: [
                          SizedBox(
                            width: 160,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                if(isInWatchlist){
                                  UserService.removeFromWatchlist(widget.film);
                                }else{
                                  UserService.addToWatchlist(widget.film);
                                }
                                setState(() {
                                  isInWatchlist = !isInWatchlist;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).dialogBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isInWatchlist ? Icons.remove_circle_outline : Icons.add_circle_outline,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    isInWatchlist
                                      ? AppLocalizations.of(context)!.delete
                                      : AppLocalizations.of(context)!.save,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
