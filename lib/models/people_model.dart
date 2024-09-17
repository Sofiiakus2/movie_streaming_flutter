
class People{
  final String id;
  final String name;
  final String metaTitle;
  final String metaDesc;
  final String posterUrl;
  final String biography;
  final String gender;
  final List<String> films;
  final String type;

  People({
    required this.id,
    required this.name,
    required this.metaTitle,
    required this.metaDesc,
    required this.posterUrl,
    required this.biography,
    required this.gender,
    required this.films,
    required this.type,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meta_title': metaTitle,
      'meta_desc': metaDesc,
      'poster_url': posterUrl,
      'biography': biography,
      'gender': gender,
      'films': films,
      'type': type,
    };
  }

}

List<People> actors = [
  People(
    id: '1',
    name: 'Leonardo DiCaprio',
    metaTitle: 'Leonardo DiCaprio - Biography, Movies, Awards',
    metaDesc: 'Leonardo DiCaprio is an acclaimed actor known for his roles in Titanic, Inception, and The Revenant.',
    posterUrl: 'https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg',
    biography: 'Leonardo DiCaprio is an American actor and film producer known for his versatile performances.',
    gender: 'Male',
    films: ['1', '5'],
    type: 'actor',
  ),
  People(
    id: '2',
    name: 'Scarlett Johansson',
    metaTitle: 'Scarlett Johansson - Biography, Movies, Awards',
    metaDesc: 'Scarlett Johansson is an American actress known for her roles in The Avengers, Lost in Translation, and Lucy.',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BMTM3OTUwMDYwNl5BMl5BanBnXkFtZTcwNTUyNzc3Nw@@._V1_.jpg',
    biography: 'Scarlett Johansson is an American actress and singer. She is the world\'s highest-paid actress.',
    gender: 'Female',
    films: ['The 2', '1'],
    type: 'actor',
  ),
  People(
    id: '3',
    name: 'Robert Downey Jr.',
    metaTitle: 'Robert Downey Jr. - Biography, Movies, Awards',
    metaDesc: 'Robert Downey Jr. is an American actor known for his role as Iron Man in the Marvel Cinematic Universe.',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_.jpg',
    biography: 'Robert Downey Jr. is an American actor and producer. He is best known for portraying Tony Stark/Iron Man.',
    gender: 'Male',
    films: ['3', '8'],
    type: 'actor',
  ),
  People(
    id: '4',
    name: 'Natalie Portman',
    metaTitle: 'Natalie Portman - Biography, Movies, Awards',
    metaDesc: 'Natalie Portman is an Israeli-American actress known for her roles in Black Swan, V for Vendetta, and Star Wars.',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BYzU0ZGRhZWItMGJlNy00YzlkLWIzOWYtNDA2NzlhMDg3YjMwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg',
    biography: 'Natalie Portman is an Israeli-American actress, director, and producer. She has received numerous awards.',
    gender: 'Female',
    films: ['7', '4'],
    type: 'actor',
  ),
  People(
    id: '5',
    name: 'Tom Hanks',
    metaTitle: 'Tom Hanks - Biography, Movies, Awards',
    metaDesc: 'Tom Hanks is an American actor known for his roles in Forrest Gump, Saving Private Ryan, and Cast Away.',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BMTQ2MjMwNDA3Nl5BMl5BanBnXkFtZTcwMTA2NDY3NQ@@._V1_.jpg',
    biography: 'Tom Hanks is an American actor and filmmaker. He is known for his comedic and dramatic roles in a number of films.',
    gender: 'Male',
    films: ['6', '10'],
    type: 'actor',
  ),
];

List<People> creators = [
  People(
  id: '6',
  name: 'Christopher Nolan',
  metaTitle: 'Christopher Nolan - Renowned Director',
  metaDesc: 'Christopher Nolan is a British-American filmmaker known for his complex narratives and innovative visual storytelling.',
  posterUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRQJlKetJRpflzPu3ymPX9OwOM5AIVjLi_3UH_8ZY1hvKows7SI',
  biography: 'Christopher Nolan is a British-American film director, producer, and screenwriter. He is known for his work on films such as "Inception," "The Dark Knight Trilogy," and "Interstellar."',
  gender: 'Male',
  films: ['1', '2', '3'],
  type: 'creator',
)];

