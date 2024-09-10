
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/film_serial_pages/film_page/details/actors_info_grid.dart';
import 'package:movie_sctreaming/models/people_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/studio_model.dart';
import '../film_page.dart';

class FilmInfo extends StatelessWidget {
  const FilmInfo({
    super.key,
    required this.widget,
  });

  final FilmPage widget;

  StudioModel findStudioById(String id) {
    return studios.firstWhere(
          (studio) => studio.id == id,
      orElse: () => throw Exception('Studio not found'),
    );
  }


  @override
  Widget build(BuildContext context) {
    StudioModel studio = findStudioById(widget.film.studio_id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${AppLocalizations.of(context)!.rating}: ${widget.film.vote_average.toString()}', style: Theme.of(context).textTheme.titleMedium),
            Text('${AppLocalizations.of(context)!.votes}: ${widget.film.vote_count.toString()}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 20),
        Text(AppLocalizations.of(context)!.overview, style: Theme.of(context).textTheme.titleMedium),
        Text(
          widget.film.overview,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Text('${AppLocalizations.of(context)!.country}: ${widget.film.country}', style: Theme.of(context).textTheme.titleMedium),
        Text('${AppLocalizations.of(context)!.studio}: ${studio.name}', style: Theme.of(context).textTheme.titleMedium),
        Text('${AppLocalizations.of(context)!.quality}: ${widget.film.quatily}', style: Theme.of(context).textTheme.titleMedium),
        Text('${AppLocalizations.of(context)!.originalTitle}: ${widget.film.original_title}', style: Theme.of(context).textTheme.titleMedium),
        Text(
          '${AppLocalizations.of(context)!.translations}: ${widget.film.translation.join(', ')}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          '${AppLocalizations.of(context)!.subtitles}: ${widget.film.subtitles.join(', ')}',
          style: Theme.of(context).textTheme.titleMedium,
        ),

        const SizedBox(height: 20),
        Text(AppLocalizations.of(context)!.creators, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        PeopleInfoGrid( people: creators,),

        const SizedBox(height: 20),
        Text(AppLocalizations.of(context)!.actors, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        PeopleInfoGrid( people: actors,),

      ],
    );
  }
}
