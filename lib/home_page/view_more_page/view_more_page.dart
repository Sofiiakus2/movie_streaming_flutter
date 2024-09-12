import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/media_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../favourite_page/movies_grid_view.dart';
import '../../services/filters_service.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({super.key});

  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage> {
  late Future<List<MediaModel>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = FiltersService.getMoviesFromDBWithFilters();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.alphaBlend(Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.popular_films,
              style: Theme.of(context).textTheme.displaySmall,
            ),
           const SizedBox(height: 15,),
           MoviesGridView(fetchMovies:_moviesFuture),
          ],
        ),
      ),
    );
  }
}
