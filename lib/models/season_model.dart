
import 'package:movie_sctreaming/models/series_model.dart';

class SeasonModel{
  final String id;
  final String name;
  final String metaTitle;
  final String metaDesc;
  final String overview;
  final int seriesCount;
  final String generalDuration;
  final String posterUrl;
  final String status;
  final List<SeriesModel> series;

  SeasonModel({
    required this.id,
    required this.name,
    required this.metaTitle,
    required this.metaDesc,
    required this.overview,
    required this.seriesCount,
    required this.generalDuration,
    required this.posterUrl,
    required this.status,
    required this.series,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meta_title': metaTitle,
      'meta_desc': metaDesc,
      'overview': overview,
      'series_count': seriesCount,
      'general_duration': generalDuration,
      'poster_url': posterUrl,
      'status': status,
      'series': series.map((s) => s.toMap()).toList(),
    };
  }

  factory SeasonModel.fromMap(Map<String, dynamic> map) {
    return SeasonModel(
      id: map['id'],
      name: map['name'],
      metaTitle: map['meta_title'],
      metaDesc: map['meta_desc'],
      overview: map['overview'],
      seriesCount: map['series_count'],
      generalDuration: map['general_duration'],
      posterUrl: map['poster_url'],
      status: map['status'],
      series: (map['series'] as List).map((s) => SeriesModel.fromMap(s)).toList(),
    );
  }

}