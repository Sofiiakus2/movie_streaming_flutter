class GenreModel{
  final String id;
  final String name;
  final String metaTitle;
  final String metaDesc;
  final String description;

  GenreModel({
    required this.id,
    required this.name,
    required this.metaTitle,
    required this.metaDesc,
    required this.description,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meta_title': metaTitle,
      'meta_desc': metaDesc,
      'description': description,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map){
    return GenreModel(
        id: map['id'],
        name: map['name'],
        metaTitle: map['meta_title'],
        metaDesc: map['meta_desc'],
        description: map['description']
    );
  }

  static String getGenreNames(List<String> genreIds) {
    return genreIds.map((id) {
      final genre = movieGenres.firstWhere(
            (genre) => genre.id == id,
        orElse: () => GenreModel(id: '0', name: 'Unknown', metaTitle: '', metaDesc: '', description: ''),
      );
      return genre.name;
    }).join(', ');
  }
}

List<GenreModel> movieGenres = [
  GenreModel(
    id: '1',
    name: 'Action',
    metaTitle: 'Action Movies',
    metaDesc: 'Fast-paced movies with lots of physical activities',
    description: 'Action movies are characterized by physical action, including fighting, chases, and explosions.',
  ),
  GenreModel(
    id: '2',
    name: 'Comedy',
    metaTitle: 'Comedy Movies',
    metaDesc: 'Movies that make you laugh',
    description: 'Comedy movies are designed to elicit laughter from the audience with humorous dialogues and situations.',
  ),
  GenreModel(
    id: '3',
    name: 'Drama',
    metaTitle: 'Drama Movies',
    metaDesc: 'Emotionally intense movies with realistic characters',
    description: 'Drama movies focus on realistic storytelling and characters, often dealing with emotional themes.',
  ),
  GenreModel(
    id: '4',
    name: 'Horror',
    metaTitle: 'Horror Movies',
    metaDesc: 'Scary movies that invoke fear',
    description: 'Horror movies are intended to scare the audience with suspenseful and frightening elements.',
  ),
  GenreModel(
    id: '5',
    name: 'Science Fiction',
    metaTitle: 'Sci-Fi Movies',
    metaDesc: 'Movies exploring futuristic concepts and advanced technology',
    description: 'Science fiction movies often explore futuristic concepts, space exploration, and advanced technology.',
  ),
  GenreModel(
    id: '6',
    name: 'Romance',
    metaTitle: 'Romance Movies',
    metaDesc: 'Movies about love and relationships',
    description: 'Romance movies focus on the relationships between characters, often exploring love and heartbreak.',
  ),
  GenreModel(
    id: '7',
    name: 'Thriller',
    metaTitle: 'Thriller Movies',
    metaDesc: 'Movies filled with suspense and tension',
    description: 'Thriller movies are designed to keep the audience on the edge of their seat with suspenseful plots.',
  ),
  GenreModel(
    id: '8',
    name: 'Fantasy',
    metaTitle: 'Fantasy Movies',
    metaDesc: 'Movies set in imaginary worlds with magical elements',
    description: 'Fantasy movies transport the audience to magical worlds, often featuring mythical creatures and supernatural events.',
  ),
  GenreModel(
    id: '9',
    name: 'Documentary',
    metaTitle: 'Documentary Movies',
    metaDesc: 'Movies based on real events and facts',
    description: 'Documentary movies aim to educate the audience by presenting real-life events, people, and facts.',
  ),
  GenreModel(
    id: '10',
    name: 'Animation',
    metaTitle: 'Animated Movies',
    metaDesc: 'Movies created through animation techniques',
    description: 'Animated movies are created using computer-generated imagery or traditional hand-drawn techniques.',
  ),
];