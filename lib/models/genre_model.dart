class GenreModel{
  final String id;
  final String name;
  final String meta_title;
  final String meta_desc;
  final String description;

  GenreModel({
    required this.id,
    required this.name,
    required this.meta_title,
    required this.meta_desc,
    required this.description,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meta_title': meta_title,
      'meta_desc': meta_desc,
      'description': description,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map){
    return GenreModel(
        id: map['id'],
        name: map['name'],
        meta_title: map['meta_title'],
        meta_desc: map['meta_desc'],
        description: map['description']
    );
  }

  static String getGenreNames(List<String> genreIds) {
    return genreIds.map((id) {
      final genre = movieGenres.firstWhere(
            (genre) => genre.id == id,
        orElse: () => GenreModel(id: '0', name: 'Unknown', meta_title: '', meta_desc: '', description: ''),
      );
      return genre.name;
    }).join(', ');
  }
}

List<GenreModel> movieGenres = [
  GenreModel(
    id: '1',
    name: 'Action',
    meta_title: 'Action Movies',
    meta_desc: 'Fast-paced movies with lots of physical activities',
    description: 'Action movies are characterized by physical action, including fighting, chases, and explosions.',
  ),
  GenreModel(
    id: '2',
    name: 'Comedy',
    meta_title: 'Comedy Movies',
    meta_desc: 'Movies that make you laugh',
    description: 'Comedy movies are designed to elicit laughter from the audience with humorous dialogues and situations.',
  ),
  GenreModel(
    id: '3',
    name: 'Drama',
    meta_title: 'Drama Movies',
    meta_desc: 'Emotionally intense movies with realistic characters',
    description: 'Drama movies focus on realistic storytelling and characters, often dealing with emotional themes.',
  ),
  GenreModel(
    id: '4',
    name: 'Horror',
    meta_title: 'Horror Movies',
    meta_desc: 'Scary movies that invoke fear',
    description: 'Horror movies are intended to scare the audience with suspenseful and frightening elements.',
  ),
  GenreModel(
    id: '5',
    name: 'Science Fiction',
    meta_title: 'Sci-Fi Movies',
    meta_desc: 'Movies exploring futuristic concepts and advanced technology',
    description: 'Science fiction movies often explore futuristic concepts, space exploration, and advanced technology.',
  ),
  GenreModel(
    id: '6',
    name: 'Romance',
    meta_title: 'Romance Movies',
    meta_desc: 'Movies about love and relationships',
    description: 'Romance movies focus on the relationships between characters, often exploring love and heartbreak.',
  ),
  GenreModel(
    id: '7',
    name: 'Thriller',
    meta_title: 'Thriller Movies',
    meta_desc: 'Movies filled with suspense and tension',
    description: 'Thriller movies are designed to keep the audience on the edge of their seat with suspenseful plots.',
  ),
  GenreModel(
    id: '8',
    name: 'Fantasy',
    meta_title: 'Fantasy Movies',
    meta_desc: 'Movies set in imaginary worlds with magical elements',
    description: 'Fantasy movies transport the audience to magical worlds, often featuring mythical creatures and supernatural events.',
  ),
  GenreModel(
    id: '9',
    name: 'Documentary',
    meta_title: 'Documentary Movies',
    meta_desc: 'Movies based on real events and facts',
    description: 'Documentary movies aim to educate the audience by presenting real-life events, people, and facts.',
  ),
  GenreModel(
    id: '10',
    name: 'Animation',
    meta_title: 'Animated Movies',
    meta_desc: 'Movies created through animation techniques',
    description: 'Animated movies are created using computer-generated imagery or traditional hand-drawn techniques.',
  ),
];