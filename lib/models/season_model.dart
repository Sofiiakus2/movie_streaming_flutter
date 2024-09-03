
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meta_title': meta_title,
      'meta_desc': meta_desc,
      'overview': overview,
      'series_count': series_count,
      'general_duration': general_duration,
      'poster_url': poster_url,
      'status': status,
      'series': series.map((s) => s.toMap()).toList(),
    };
  }

  factory SeasonModel.fromMap(Map<String, dynamic> map) {
    return SeasonModel(
      id: map['id'],
      name: map['name'],
      meta_title: map['meta_title'],
      meta_desc: map['meta_desc'],
      overview: map['overview'],
      series_count: map['series_count'],
      general_duration: map['general_duration'],
      poster_url: map['poster_url'],
      status: map['status'],
      series: (map['series'] as List).map((s) => SeriesModel.fromMap(s)).toList(),
    );
  }

}