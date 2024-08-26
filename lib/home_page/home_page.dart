import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/media_model.dart';

import 'carousel_banner.dart';
import 'movie_horizontal_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final List<MediaModel> selectedMovies = movies.sublist(5, 10);
    return Scaffold(
      backgroundColor: Color.alphaBlend(Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
        appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          leading: Icon(
            Icons.search,
            color:  Theme.of(context).dialogBackgroundColor,
            size: 30,
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.account_circle_rounded,
                color:  Theme.of(context).dialogBackgroundColor,
                size: 34,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CarouselBanner(),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Популярні',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text(
                          'Переглянути всі >',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor
                          ),
                        ))
                  ],
                ),
              ),
              MovieHorizontalList(movies: movies),

              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Найкращі',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text(
                          'Переглянути всі >',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor
                          ),
                        ))
                  ],
                ),
              ),
              MovieHorizontalList(movies: selectedMovies),
          
          
            ],
          ),
        )

    );
  }
}
