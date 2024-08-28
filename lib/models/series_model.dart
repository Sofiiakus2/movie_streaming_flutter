class SeriesModel{
  final String id;
  final String name;
  final String meta_title;
  final String meta_desc;
  final String overview;
  final String poster_url;
  final String duration;
  final String video_url;
  final DateTime date;
  final bool released;


  SeriesModel({
    required this.id,
    required this.name,
    required this.meta_title,
    required this.meta_desc,
    required this.overview,
    required this.poster_url,
    required this.duration,
    required this.video_url,
    required this.date,
    required this.released,
});
}