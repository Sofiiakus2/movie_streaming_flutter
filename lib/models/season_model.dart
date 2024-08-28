
import 'package:movie_sctreaming/models/series_model.dart';

class SeasonModel{
  final String id;
  final String name;
  final String meta_title;
  final String meta_desc;
  final String overview;
  final int series_count;
  final String general_duration;
  final String poster_url;
  final String status;
  final List<SeriesModel> series;

  SeasonModel({
    required this.id,
    required this.name,
    required this.meta_title,
    required this.meta_desc,
    required this.overview,
    required this.series_count,
    required this.general_duration,
    required this.poster_url,
    required this.status,
    required this.series,
});

}