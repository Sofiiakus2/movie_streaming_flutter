
import 'package:movie_sctreaming/models/comment_model.dart';
import 'package:movie_sctreaming/models/season_model.dart';
import 'package:movie_sctreaming/models/series_model.dart';

import '../services/media_service.dart';

class MediaModel{
  final String id;
  final String title;
  final String originalTitle;
  final String metaTitle;
  final String metaDesc;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String mediaType;
  final bool adult;
  final String country;
  final String age;
  final double popularity;
  final DateTime releaseDate;
  final String videoUrl;
  final double voteAverage;
  final int voteCount;
  final List<String> postersUrl;
  final String trailerUrl;
  final String quatily;
  final String generalDuration;
  final List<String> genres;
  final List<String> subtitles;
  final List<String> translation;
  final List<String> mainActors;
  final List<String> creators;
  final String studioId;
  final List<SeasonModel>? seasons;
  final List<CommentModel>? comments;

  MediaModel(
  {
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.metaTitle,
    required this.metaDesc,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.country,
    required this.age,
    required this.popularity,
    required this.releaseDate,
    required this.videoUrl,
    required this.voteAverage,
    required this.voteCount,
    required this.postersUrl,
    required this.trailerUrl,
    required this.quatily,
    required this.generalDuration,
    required this.genres,
    required this.subtitles,
    required this.translation,
    required this.mainActors,
    required this.creators,
    required this.studioId,
    this.seasons,
    this.comments,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'meta_title': metaTitle.toLowerCase(),
      'meta_desc': metaDesc,
      'overview': overview,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'media_type': mediaType,
      'adult': adult,
      'country': country,
      'age': age,
      'popularity': popularity,
      'release_date': releaseDate.toIso8601String(),
      'video_url': videoUrl,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'posters_url': postersUrl,
      'trailer_url': trailerUrl,
      'quatily': quatily,
      'general_duration': generalDuration,
      'genres': genres,
      'subtitles': subtitles,
      'translation': translation,
      'main_actors': mainActors,
      'creators': creators,
      'studio_id': studioId,
      'seasons': seasons?.map((season) => season.toMap()).toList(),
    };
  }

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return MediaModel(
      id: map['id'],
      title: map['title'],
      originalTitle: map['original_title'],
      metaTitle: map['meta_title'],
      metaDesc: map['meta_desc'],
      overview: map['overview'],
      backdropPath: map['backdrop_path'],
      posterPath: map['poster_path'],
      mediaType: map['media_type'],
      adult: map['adult'],
      country: map['country'],
      age: map['age'],
      popularity: map['popularity'],
      releaseDate: DateTime.parse(map['release_date']),
      videoUrl: map['video_url'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
      postersUrl: List<String>.from(map['posters_url']),
      trailerUrl: map['trailer_url'],
      quatily: map['quatily'],
      generalDuration: map['general_duration'],
      genres: List<String>.from(map['genres']),
      subtitles: List<String>.from(map['subtitles']),
      translation: List<String>.from(map['translation']),
      mainActors: List<String>.from(map['main_actors']),
      creators: List<String>.from(map['creators']),
      studioId: map['studio_id'],
      seasons: map['seasons'] != null
          ? (map['seasons'] as List).map((s) => SeasonModel.fromMap(s)).toList()
          : null,
    );
  }
}
Future<List<MediaModel>> fetchMovies() async {
  return await MediaService.getMoviesFromDB();
}

List<MediaModel> movies = [
  MediaModel(
    id: '11',
    title: 'Bridgerton',
    originalTitle: 'Bridgerton',
    metaTitle: 'The Great Journey - Epic Adventure',
    metaDesc: 'An epic journey across uncharted lands.',
    overview: 'A group of explorers set out on an adventure to discover uncharted territories.',
    backdropPath: 'https://ntvb.tmsimg.com/assets/p18974714_b_h10_ao.jpg?w=960&h=540',
    posterPath: 'https://m.media-amazon.com/images/M/MV5BY2ZiODA2MGYtMmMxMi00YjlmLWFmYjktMWYyOTMwNWFkNWNkXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_QL75_UX190_CR0,0,190,281_.jpg',
    mediaType: 'series',
    adult: false,
    country: 'USA',
    age: '18+',
    popularity: 8.5,
    releaseDate: DateTime(2022, 1, 15),
    videoUrl: '',
    voteAverage: 8.8,
    voteCount: 1245,
    postersUrl: ['https://m.media-amazon.com/images/I/A1RZ8fyr2HL._UF1000,1000_QL80_.jpg'],
    trailerUrl: 'https://www.youtube.com/watch?v=Q7xYGhRfjMg',
    quatily: 'HD',
    generalDuration: '45min per episode',
    genres: ['2', '4'],
    subtitles: ['English', 'Spanish'],
    translation: ['English', 'Spanish'],
    mainActors: ['2', '3'],
    creators: ['1'],
    studioId: '1',
    seasons: [
      SeasonModel(
        id: '1',
        name: 'Season 1',
        metaTitle: 'The Great Journey - Season 1',
        metaDesc: 'The beginning of an epic adventure.',
        overview: 'The group begins their journey into the unknown.',
        seriesCount: 2,
        generalDuration: '45min per episode',
        posterUrl: 'https://i.ytimg.com/vi/YtLzCI8Cxd0/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCH3F9gJj561j0AJT49wvAau-bdpA',
        status: 'Released',
        series: [
          SeriesModel(
            id: '1',
            name: 'The Adventure Begins',
            metaTitle: 'The Adventure Begins',
            metaDesc: 'The first steps into the unknown.',
            overview: 'The explorers take their first steps into the wild.',
            posterUrl: 'https://i.ytimg.com/vi/YtLzCI8Cxd0/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCH3F9gJj561j0AJT49wvAau-bdpA',
            duration: '45min',
            videoUrl: 'https://avtshare01.rz.tu-ilmenau.de/avt-vqdb-uhd-1/test_1/segments/cutting_orange_tuil_15000kbps_1080p_59.94fps_h264.mp4',
            date: DateTime(2022, 1, 15),
            released: true,
          ),
          SeriesModel(
            id: '2',
            name: 'Into the Wilderness',
            metaTitle: 'Into the Wilderness',
            metaDesc: 'The journey takes a dangerous turn.',
            overview: 'The group faces their first major challenge.',
            posterUrl: 'https://pyxis.nymag.com/v1/imgs/430/8c4/c08c2b84ae32273e8c2388fb84037ef45d-bridgerton-recaps-ep-02.2x.rsocial.w600.jpg',
            duration: '45min',
            videoUrl: 'https://avtshare01.rz.tu-ilmenau.de/avt-vqdb-uhd-1/test_1/segments/vegetables_tuil_15000kbps_1080p_59.94fps_h264.mp4',
            date: DateTime(2022, 1, 22),
            released: true,
          ),
        ],
      ),
      SeasonModel(
        id: '2',
        name: 'Season 2',
        metaTitle: 'The Great Journey - Season 2',
        metaDesc: 'The journey continues with new challenges.',
        overview: 'The group faces harsher environments and internal conflicts.',
        seriesCount: 2,
        generalDuration: '45min per episode',
        posterUrl: '/path_to_season2_poster.jpg',
        status: 'Released',
        series: [
          SeriesModel(
            id: '1',
            name: 'Crossing the Desert',
            metaTitle: 'Crossing the Desert',
            metaDesc: 'The explorers face a scorching desert.',
            overview: 'The group must survive the harsh desert conditions.',
            posterUrl: 'https://pyxis.nymag.com/v1/imgs/101/96c/71ec8b8d433e3cafe6ace14da7cce7b681-bridgerton-s2-ep-01.2x.rsocial.w600.jpg',
            duration: '45min',
            videoUrl: '/path_to_episode3_video.mp4',
            date: DateTime(2023, 2, 10),
            released: true,
          ),
          SeriesModel(
            id: '2',
            name: 'The Mountain Pass',
            metaTitle: 'The Mountain Pass',
            metaDesc: 'A treacherous mountain path stands in their way.',
            overview: 'The group must find a way through the perilous mountains.',
            posterUrl: 'https://pyxis.nymag.com/v1/imgs/2a2/7e4/b7dc5378ae9d2e268b29d3a84e63d517c1-bridgerton-s2-ep-02.2x.rsocial.w600.jpg',
            duration: '45min',
            videoUrl: '/path_to_episode4_video.mp4',
            date: DateTime(2023, 2, 17),
            released: true,
          ),
        ],
      ),
    ],
  ),
  MediaModel(
    id: '12',
    title: 'The Boys',
    originalTitle: 'The Boys',
    metaTitle: 'Mystery of the Ancient Temple - Uncovering Secrets',
    metaDesc: 'A team of archaeologists uncovers the secrets of an ancient temple.',
    overview: 'Archaeologists explore an ancient temple with dark secrets.',
    backdropPath: 'https://m.media-amazon.com/images/S/pv-target-images/473fd8bc878799c1a035cb13c688edd9eb6d240d426abf34e0bf3c1dde95724b.jpg',
    posterPath: 'https://upload.wikimedia.org/wikipedia/uk/e/e8/The_Boys_%28poster%29.jpg',
    mediaType: 'series',
    adult: false,
    country: 'UK',
    age: '18+',
    popularity: 7.9,
    releaseDate: DateTime(2021, 10, 1),
    videoUrl: '',
    voteAverage: 8.2,
    voteCount: 980,
    postersUrl: ['https://m.media-amazon.com/images/M/MV5BYTY2ZjYyNGUtZGVkZS00MDNhLWIwMjMtZDk4MmQ5ZWI0NTY4XkEyXkFqcGdeQXVyMTY3MDE5MDY1._V1_QL75_UY281_CR18,0,190,281_.jpg'],
    trailerUrl: 'https://www.youtube.com/watch?v=5SKP1_F7ReE',
    quatily: 'HD',
    generalDuration: '50min per episode',
    genres: ['4', '5'],
    subtitles: ['English', 'French'],
    translation: ['English', 'French'],
    mainActors: ['1', '5'],
    creators: ['1',],
    studioId: '2',
    seasons: [
      SeasonModel(
        id: 'season1',
        name: 'Season 1',
        metaTitle: 'Mystery of the Ancient Temple - Season 1',
        metaDesc: 'Unveiling the temple\'s dark secrets.',
        overview: 'The team discovers the entrance to the ancient temple.',
        seriesCount: 2,
        generalDuration: '50min per episode',
        posterUrl: '/path_to_season1_poster2.jpg',
        status: 'Released',
        series: [
          SeriesModel(
            id: 'episode1',
            name: 'The Discovery',
            metaTitle: 'The Discovery',
            metaDesc: 'The team uncovers the entrance to the temple.',
            overview: 'Archaeologists find the entrance to the ancient temple.',
            posterUrl: '/path_to_episode1_poster2.jpg',
            duration: '50min',
            videoUrl: '/path_to_episode5_video.mp4',
            date: DateTime(2021, 10, 1),
            released: true,
          ),
          SeriesModel(
            id: 'episode2',
            name: 'The First Trial',
            metaTitle: 'The First Trial',
            metaDesc: 'The team faces the temple\'s first challenge.',
            overview: 'The archaeologists encounter the temple\'s first booby trap.',
            posterUrl: '/path_to_episode2_poster2.jpg',
            duration: '50min',
            videoUrl: '/path_to_episode6_video.mp4',
            date: DateTime(2021, 10, 8),
            released: true,
          ),
        ],
      ),
      SeasonModel(
        id: 'season2',
        name: 'Season 2',
        metaTitle: 'Mystery of the Ancient Temple - Season 2',
        metaDesc: 'Diving deeper into the temple\'s mysteries.',
        overview: 'The team ventures further into the temple, facing greater dangers.',
        seriesCount: 2,
        generalDuration: '50min per episode',
        posterUrl: '/path_to_season2_poster2.jpg',
        status: 'Released',
        series: [
          SeriesModel(
            id: 'episode1',
            name: 'The Hidden Chamber',
            metaTitle: 'The Hidden Chamber',
            metaDesc: 'A secret chamber is discovered.',
            overview: 'The team finds a hidden chamber with ancient artifacts.',
            posterUrl: '/path_to_episode7_poster.jpg',
            duration: '50min',
            videoUrl: '/path_to_episode7_video.mp4',
            date: DateTime(2022, 1, 5),
            released: true,
          ),
          SeriesModel(
            id: 'episode2',
            name: 'The Final Puzzle',
            metaTitle: 'The Final Puzzle',
            metaDesc: 'The team solves the temple\'s final puzzle.',
            overview: 'The archaeologists work together to solve the temple\'s last challenge.',
            posterUrl: '/path_to_episode8_poster.jpg',
            duration: '50min',
            videoUrl: '/path_to_episode8_video.mp4',
            date: DateTime(2022, 1, 12),
            released: true,
          ),
        ],
      ),
    ],
  ),
  MediaModel(
    id: "1",
    title: "The Shawshank Redemption",
    originalTitle: "The Shawshank Redemption",
    metaTitle: "Shawshank Redemption",
    metaDesc: "Two imprisoned men bond over a number of years.",
    overview: "Andy Dufresne, a successful banker, is imprisoned for the murders of his wife and her lover, and he is sentenced to life imprisonment at the Shawshank prison.",
    backdropPath: "/path1.jpg",
    posterPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbECd2GUCQtWhDUu7b0R1PoHGRbY5OC_mISw&s",
    mediaType: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 95.0,
    releaseDate: DateTime(1994, 9, 23),
    videoUrl: "https://avtshare01.rz.tu-ilmenau.de/avt-vqdb-uhd-1/test_1/segments/bigbuck_bunny_8bit_15000kbps_1080p_60.0fps_h264.mp4",
    voteAverage: 9.3,
    voteCount: 22000,
      postersUrl: ["https://www.tallengestore.com/cdn/shop/products/Movie_Poster_Art_-_The_Shawshank_Redemption_-_Tallenge_Hollywood_Poster_Collection.jpg?v=1577959686"],
    trailerUrl: "https://www.youtube.com/watch?v=NmzuHjWmXOc",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '1',
  ),
  MediaModel(
    id: "2",
    title: "The Godfather",
    originalTitle: "The Godfather",
    metaTitle: "Godfather",
    metaDesc: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
    overview: "The Godfather is an American crime film directed by Francis Ford Coppola.",
    backdropPath: "/path2.jpg",
    posterPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH9NDr86lyRrd7hZel8g9d3cYr0Qwxs9xQ5g&s",
    mediaType: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 92.0,
    releaseDate: DateTime(1972, 3, 24),
    videoUrl: "https://www.youtube.com/watch?v=sY1S34973zA",
    voteAverage: 9.2,
    voteCount: 19000,
    postersUrl: ["https://i.ebayimg.com/images/g/T7gAAOSwc6ti7FM7/s-l400.jpg"],
    trailerUrl: "https://www.youtube.com/watch?v=UaVTIH8mujA",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '2',
  ),
  MediaModel(
    id: "3",
    title: "The Dark Knight",
    originalTitle: "The Dark Knight",
    metaTitle: "Dark Knight",
    metaDesc: "Batman faces the Joker, a criminal mastermind who wants to plunge Gotham City into anarchy.",
    overview: "Batman raises the stakes in his war on crime with the help of Lt. Jim Gordon and District Attorney Harvey Dent.",
    backdropPath: "/path3.jpg",
    posterPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3ekE6Hhz9gvIbiFSUPxt-FyAh4zXTXX0bjQ&s",
    mediaType: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 98.0,
    releaseDate: DateTime(2008, 7, 18),
    videoUrl: "https://www.youtube.com/watch?v=EXeTwQWrcwY",
    voteAverage: 9.0,
    voteCount: 25000,
    postersUrl: ["https://filmartgallery.com/cdn/shop/products/The-Dark-Knight-Vintage-Movie-Poster-Original-1-Sheet-27x41_f88e9b5a-9955-487f-81d9-b0fae8dbcffe.jpg?v=1677042170"],
    trailerUrl: "https://www.youtube.com/watch?v=EXeTwQWrcwY",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '3',
  ),
  MediaModel(
    id: "4",
    title: "Pulp Fiction",
    originalTitle: "Pulp Fiction",
    metaTitle: "Pulp Fiction",
    metaDesc: "The lives of two mob hitmen, a boxer, a gangster, and his wife intertwine in four tales of violence and redemption.",
    overview: "Pulp Fiction is an American neo-noir black comedy crime film written and directed by Quentin Tarantino.",
    backdropPath: "/path4.jpg",
    posterPath: "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    mediaType: "movie",
    adult: true,
    country: "USA",
    age: "16+",
    popularity: 90.0,
    releaseDate: DateTime(1994, 10, 14),
    videoUrl: "https://www.youtube.com/watch?v=s7EdQ4FqbhY",
    voteAverage: 8.9,
    voteCount: 21000,
    postersUrl: ["https://image.tmdb.org/t/p/original/wZbnRMarWnO4DJRisOaK4QEg1tl.jpg"],
    trailerUrl: "https://www.youtube.com/watch?v=tGpTpVyI_OQ",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '4',
  ),
  MediaModel(
    id: "5",
    title: "Schindler's List",
    originalTitle: "Schindler's List",
    metaTitle: "Schindler's List",
    metaDesc: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce.",
    overview: "Schindler's List is an American epic historical drama film directed and produced by Steven Spielberg.",
    backdropPath: "/path5.jpg",
    posterPath: "https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
    mediaType: "movie",
    adult: true,
    country: "USA",
    age: "16+",
    popularity: 85.0,
    releaseDate: DateTime(1993, 12, 15),
    videoUrl: "https://www.youtube.com/watch?v=gG22XNhtnoY",
    voteAverage: 8.9,
    voteCount: 20000,
    postersUrl: ["https://filmartgallery.com/cdn/shop/products/Schindlers-List-Vintage-Movie-Poster-Original-1-Sheet-27x41-6807_92bfcd15-9a90-439a-ae24-6bc0387db872.jpg?v=1663221618"],
    trailerUrl: "https://www.youtube.com/watch?v=mxphAlJID9U",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '5',
  ),
  MediaModel(
    id: "6",
    title: "The Lord of the Rings: The Return of the King",
    originalTitle: "The Lord of the Rings: The Return of the King",
    metaTitle: "LOTR: Return of the King",
    metaDesc: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
    overview: "The final confrontation between the forces of good and evil fighting for control of the future of Middle-earth.",
    backdropPath: "/path6.jpg",
    posterPath: "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    mediaType: "movie",
    adult: false,
    country: "New Zealand",
    age: "16+",
    popularity: 88.0,
    releaseDate: DateTime(2003, 12, 17),
    videoUrl: "https://www.youtube.com/watch?v=r5X-hFf6Bwo",
    voteAverage: 8.9,
    voteCount: 21000,
    postersUrl: ["https://alternativemovieposters.com/wp-content/uploads/2022/10/PhantomCity_ReturnOfTheKing.jpg"],
    trailerUrl: "https://www.youtube.com/watch?v=r5X-hFf6Bwo",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '1',
  ),
  MediaModel(
    id: "7",
    title: "Fight Club",
    originalTitle: "Fight Club",
    metaTitle: "Fight Club",
    metaDesc: "An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.",
    overview: "Fight Club is a 1999 American film directed by David Fincher, based on the 1996 novel of the same name by Chuck Palahniuk.",
    backdropPath: "/path7.jpg",
    posterPath: "https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg",
    mediaType: "movie",
    adult: true,
    country: "USA",
    age: "16+",
    popularity: 87.0,
    releaseDate: DateTime(1999, 10, 15),
    videoUrl: "https://www.youtube.com/watch?v=SUXWAEX2jlg",
    voteAverage: 8.8,
    voteCount: 21000,
    postersUrl: ["https://m.media-amazon.com/images/I/61bocjnue+L._AC_UF894,1000_QL80_.jpg"],
    trailerUrl: "https://www.youtube.com/watch?v=BdJKm16Co6M",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '2',
  ),
  MediaModel(
    id: "8",
    title: "Forrest Gump",
    originalTitle: "Forrest Gump",
    metaTitle: "Forrest Gump",
    metaDesc: "The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75.",
    overview: "Forrest Gump is a 1994 American comedy-drama film directed by Robert Zemeckis and written by Eric Roth.",
    backdropPath: "/path8.jpg",
    posterPath: "https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg",
    mediaType: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 85.0,
    releaseDate: DateTime(1994, 7, 6),
    videoUrl: "https://www.youtube.com/watch?v=bLvqoHBptjg",
    voteAverage: 8.8,
    voteCount: 21000,
    postersUrl: ["https://product-image.juniqe-production.juniqe.com/media/catalog/product/seo-cache/x800/92/376/92-376-101P/Forrest-Gump-Naxart-Poster.jpg"],
    trailerUrl: "https://www.youtube.com/watch?v=bLvqoHBptjg",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '3',
  ),
  MediaModel(
    id: "9",
    title: "Inception",
    originalTitle: "Inception",
    metaTitle: "Inception",
    metaDesc: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
    overview: "Inception is a 2010 science fiction action film written and directed by Christopher Nolan.",
    backdropPath: "/path9.jpg",
    posterPath: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_QL75_UX190_CR0,0,190,281_.jpg",
    mediaType: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 94.0,
    releaseDate: DateTime(2010, 7, 16),
    videoUrl: "https://www.youtube.com/watch?v=YoHD9XEInc0",
    voteAverage: 8.7,
    voteCount: 22000,
    postersUrl: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuNMFrEDOai-0LAtswwcgJnS-yyMzB99EPZw&s"],
    trailerUrl: "https://www.youtube.com/watch?v=YoHD9XEInc0",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '4',
  ),
  MediaModel(
    id: "10",
    title: "The Matrix",
    originalTitle: "The Matrix",
    metaTitle: "Matrix",
    metaDesc: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
    overview: "The Matrix is a 1999 American science fiction action film written and directed by the Wachowskis.",
    backdropPath: "/path10.jpg",
    posterPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfSjSWOCaw5dnDL2GT1zFd9RMCgUGw5Q2Cfg&s",
    mediaType: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 90.0,
    releaseDate: DateTime(1999, 3, 31),
    videoUrl: "https://www.youtube.com/watch?v=vKQi3bBA1y8",
    voteAverage: 8.7,
    voteCount: 21000,
    postersUrl: ["https://static.posters.cz/image/750/%D0%9F%D0%BB%D0%B0%D0%BA%D0%B0%D1%82%D0%B8/the-matrix-resurrections-the-choice-is-yours-i126664.jpg"],
    trailerUrl: "https://www.youtube.com/watch?v=vKQi3bBA1y8",
    quatily: "HD",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '5',
  ),

];

List<MediaModel> newFilms = [
  MediaModel(
    id: "13",
    title: "Eclipse",
    originalTitle: "Eclipse",
    metaTitle: "Eclipse",
    metaDesc: "A group of astronauts encounters a mysterious phenomenon on a mission to the moon.",
    overview: "In 2024, a team of astronauts embarks on a mission to explore a lunar eclipse, only to uncover a force that threatens to alter the course of humanity.",
    backdropPath: "https://i.ytimg.com/vi/lLaYsyFU8UE/sddefault.jpg",
    posterPath: "https://m.media-amazon.com/images/M/MV5BZjk0Y2U3MzItNDA5OC00YTk1LTlkZDMtYTQ5YjFhNzBmMTI0XkEyXkFqcGdeQXVyMzY1NzU1OTU@._V1_QL75_UY281_CR5,0,190,281_.jpg",
    mediaType: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 85.0,
    releaseDate: DateTime(2024, 4, 14),
    videoUrl: "https://www.youtube.com/watch?v=sampleEclipseTrailer",
    voteAverage: 8.5,
    voteCount: 15000,
    postersUrl: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaAjvGrhdJVes3qQyrKspjt9n1WzeeTed9FA&s"],
    trailerUrl: "https://www.youtube.com/watch?v=sampleEclipseTrailer",
    quatily: "4K",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '1',
  ),
  MediaModel(
    id: "14",
    title: "Deadpool & Wolverine",
    originalTitle: "Deadpool & Wolverine",
    metaTitle: "Deadpool & Wolverine",
    metaDesc: "The ultimate team-up between the Merc with a Mouth and the adamantium-clawed mutant as they face a new threat.",
    overview: "In this highly anticipated crossover, Deadpool and Wolverine must join forces to stop a powerful enemy threatening the entire Marvel Universe. Expect explosive action, sharp wit, and the return of fan-favorite characters.",
    backdropPath: "https://i.ytimg.com/vi/73_1biulkYk/maxresdefault.jpg",
    posterPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbCwIcqHVA4Kd9jsfutxIcVdxHe-fSVi40PQ&s",
    mediaType: "movie",
    adult: true,
    country: "USA",
    age: "16+",
    popularity: 98.5,
    releaseDate: DateTime(2024, 11, 10),
    videoUrl: "https://www.youtube.com/watch?v=sampleDeadpoolWolverineTrailer",
    voteAverage: 8.7,
    voteCount: 25000,
    postersUrl: ["https://m.media-amazon.com/images/I/81-nnaHRgfL.jpg"],
    trailerUrl: "https://www.youtube.com/watch?v=sampleDeadpoolWolverineTrailer",
    quatily: "4K",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '3',
  ),
  MediaModel(
    id: "15",
    title: "It Ends with Us",
    originalTitle: "It Ends with Us",
    metaTitle: "It Ends with Us",
    metaDesc: "A gripping drama based on the bestselling novel by Colleen Hoover, exploring love, pain, and the complexities of relationships.",
    overview: "Adapted from Colleen Hoover's bestselling novel, this emotional drama delves into the life of Lily Bloom as she navigates through her complicated past and tumultuous present. As Lily confronts the difficult decisions she must make, the story unfolds with powerful themes of love, resilience, and heartbreak.",
    backdropPath: "https://i.ytimg.com/vi/DLET_u31M4M/hqdefault.jpg?v=664603f1",
    posterPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewXYy0R6TAHNJDzIN4sxejxT7V5EAkL4FgQ&s",
    mediaType: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 90.0,
    releaseDate: DateTime(2024, 8, 25),
    videoUrl: "https://www.youtube.com/watch?v=sampleItEndsWithUsTrailer",
    voteAverage: 8.2,
    voteCount: 15000,
    postersUrl: ["https://i.ebayimg.com/images/g/EL8AAOSwIIZmbAE5/s-l1200.jpg"],
    trailerUrl: "https://www.youtube.com/watch?v=sampleItEndsWithUsTrailer",
    quatily: "4K",
      generalDuration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    mainActors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studioId: '5',
  ),
];
