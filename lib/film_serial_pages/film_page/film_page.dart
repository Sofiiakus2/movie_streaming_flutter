import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/media_model.dart';

import '../../home_page/movie_horizontal_list.dart';
import '../../models/genre_model.dart';

class FilmPage extends StatefulWidget {
  const FilmPage({super.key, required this.film});
  final MediaModel film;

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> with SingleTickerProviderStateMixin {
  bool _isCollapsed = true;

  void _toggleCollapse() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  String getGenreNames(List<String> genreIds) {
    return genreIds.map((id) {
      final genre = movieGenres.firstWhere(
            (genre) => genre.id == id,
        orElse: () => GenreModel(id: '0', name: 'Unknown', meta_title: '', meta_desc: '', description: ''),
      );
      return genre.name;
    }).join(', ');
  }

  String formatDuration(String duration) {
    final parts = duration.split(':');
    if (parts.length != 2) {
      return 'Unknown duration';
    }

    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = int.tryParse(parts[1]) ?? 0;

    return '${hours} год ${minutes} хв';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height / 1.7,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        widget.film.posters_url[0],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 30,
                      right: 30,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.film.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
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
                                Text('${getGenreNames(widget.film.genre_ids)}',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text('${widget.film.release_date.year}',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text('${formatDuration(widget.film.general_duration)}',
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
                                              // Add functionality here
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
                                                  'Відтворити',
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
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 160,
                                          height: 45,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Add functionality here
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
                                                const Icon(
                                                  Icons.add_circle_outline,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                Text(
                                                  'Зберегти',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      constraints: BoxConstraints(
                        minHeight: 200,
                        maxHeight: _isCollapsed ? 200 : double.infinity,
                      ),

                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Рейтинг: ${widget.film.vote_average.toString()}', style: Theme.of(context).textTheme.titleMedium),
                                Text('Голосів: ${widget.film.vote_count.toString()}', style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Опис', style: Theme.of(context).textTheme.titleMedium),
                            Text(
                              widget.film.overview,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: 20),
                            Text('Країна: ${widget.film.country}', style: Theme.of(context).textTheme.titleMedium),
                            Text('Якість відео: ${widget.film.quatily}', style: Theme.of(context).textTheme.titleMedium),
                            Text(
                              'Переклади: ${widget.film.translation.join(', ')}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Субтитри: ${widget.film.subtitles.join(', ')}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: IconButton(
                  onPressed: _toggleCollapse,
                  icon: Icon(_isCollapsed ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              Container(
                  height: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                        child: Text(
                          'Схожі',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      MovieHorizontalList(movies: movies),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}
