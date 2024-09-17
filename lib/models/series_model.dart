class SeriesModel{
  final String id;
  final String name;
  final String metaTitle;
  final String metaDesc;
  final String overview;
  final String posterUrl;
  final String duration;
  final String videoUrl;
  final DateTime date;
  final bool released;


  SeriesModel({
    required this.id,
    required this.name,
    required this.metaTitle,
    required this.metaDesc,
    required this.overview,
    required this.posterUrl,
    required this.duration,
    required this.videoUrl,
    required this.date,
    required this.released,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meta_title': metaTitle,
      'meta_desc': metaDesc,
      'overview': overview,
      'poster_url': posterUrl,
      'duration': duration,
      'video_url': videoUrl,
      'date': date.toIso8601String(),
      'released': released,
    };
  }

  factory SeriesModel.fromMap(Map<String, dynamic> map) {
    return SeriesModel(
      id: map['id'],
      name: map['name'],
      metaTitle: map['meta_title'],
      metaDesc: map['meta_desc'],
      overview: map['overview'],
      posterUrl: map['poster_url'],
      duration: map['duration'],
      videoUrl: map['video_url'],
      date: DateTime.parse(map['date']),
      released: map['released'],
    );
  }
}