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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meta_title': meta_title,
      'meta_desc': meta_desc,
      'overview': overview,
      'poster_url': poster_url,
      'duration': duration,
      'video_url': video_url,
      'date': date.toIso8601String(),
      'released': released,
    };
  }

  factory SeriesModel.fromMap(Map<String, dynamic> map) {
    return SeriesModel(
      id: map['id'],
      name: map['name'],
      meta_title: map['meta_title'],
      meta_desc: map['meta_desc'],
      overview: map['overview'],
      poster_url: map['poster_url'],
      duration: map['duration'],
      video_url: map['video_url'],
      date: DateTime.parse(map['date']),
      released: map['released'],
    );
  }
}