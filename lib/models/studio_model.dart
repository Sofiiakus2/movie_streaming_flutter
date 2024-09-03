
class StudioModel{
  final String id;
  final String name;
  final String description;
  final String location;
  final List<String> media;

  StudioModel( {
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.media,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'media': media,
    };
  }
}

List<StudioModel> studios = [
  StudioModel(
    id: '1',
    name: 'Warner Bros. Pictures',
    description: 'Warner Bros. Pictures is an American film studio, a subsidiary of Warner Bros. Entertainment. Known for producing high-quality films and franchises like Harry Potter and The Matrix.',
    location: 'Burbank, California, USA',
    media: ['https://example.com/warner_bros_logo.jpg', 'https://example.com/warner_bros_studio.jpg'],
  ),
  StudioModel(
    id: '2',
    name: 'Universal Pictures',
    description: 'Universal Pictures is an American film studio headquartered in Universal City, California. It is known for its major franchises, including Jurassic Park and Fast & Furious.',
    location: 'Universal City, California, USA',
    media: ['https://example.com/universal_pictures_logo.jpg', 'https://example.com/universal_pictures_studio.jpg'],
  ),
  StudioModel(
    id: '3',
    name: '20th Century Studios',
    description: '20th Century Studios, formerly known as 20th Century Fox, is a major American film studio. It is part of The Walt Disney Company and is known for its iconic films and series.',
    location: 'Los Angeles, California, USA',
    media: ['https://example.com/20th_century_studios_logo.jpg', 'https://example.com/20th_century_studios_studio.jpg'],
  ),
  StudioModel(
    id: '4',
    name: 'Paramount Pictures',
    description: 'Paramount Pictures is an American film studio based in Hollywood. It is one of the oldest film studios and is known for producing major film franchises like Mission: Impossible and Star Trek.',
    location: 'Hollywood, California, USA',
    media: ['https://example.com/paramount_pictures_logo.jpg', 'https://example.com/paramount_pictures_studio.jpg'],
  ),
  StudioModel(
    id: '5',
    name: 'Sony Pictures Entertainment',
    description: 'Sony Pictures Entertainment is an American film studio and a subsidiary of Sony Corporation. It produces and distributes films and television series, known for its work on Spider-Man and James Bond franchises.',
    location: 'Culver City, California, USA',
    media: ['https://example.com/sony_pictures_logo.jpg', 'https://example.com/sony_pictures_studio.jpg'],
  ),
];
