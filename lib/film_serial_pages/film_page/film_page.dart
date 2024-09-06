
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/media_model.dart';

import '../../bottom_navigation_bar/bottom_nav_bar.dart';
import '../../home_page/movie_horizontal_list.dart';
import '../../models/genre_model.dart';
import '../../services/media_service.dart';
import 'details/film_info.dart';
import 'details/film_promo_info.dart';

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



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
                    FilmPromoInfo(widget: widget,),
                  ],
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      constraints: BoxConstraints(
                        minHeight: 200,
                        maxHeight: _isCollapsed ? 200 : double.infinity,
                      ),

                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: FilmInfo(widget: widget),
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
              SizedBox(
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
                      MovieHorizontalList(fetchMovies: MediaService.getMoviesFromDB()),

                    ],
                  )
              ),
            ],
          ),
        ),

    );
  }
}
