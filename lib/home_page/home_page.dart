import 'package:flutter/material.dart';
import 'package:movie_sctreaming/home_page/view_more_page/view_more_page.dart';
import 'package:movie_sctreaming/services/media_service.dart';
import 'carousel_banner.dart';
import 'movie_horizontal_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.alphaBlend(Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CarouselBanner(),
              Stack(
                children: [
                  Container(
                    width: screenSize.width,
                    height: 70,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFF1C1C1D)
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.popular_films,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ViewMorePage()),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.view_all,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor
                                  ),
                                ),
                                Icon(Icons.navigate_next, color: Theme.of(context).primaryColor, size: 18,)
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              MovieHorizontalList(fetchMovies: MediaService.getMoviesFromDB()),

              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.best_movies,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.view_all,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                            Icon(Icons.navigate_next, color: Theme.of(context).primaryColor, size: 18,)
                          ],
                        ))
                  ],
                ),
              ),

          
            ],
          ),
        )

    );
  }
}
