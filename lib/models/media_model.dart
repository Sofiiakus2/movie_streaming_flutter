
import 'package:movie_sctreaming/models/season_model.dart';
import 'package:movie_sctreaming/models/series_model.dart';

class MediaModel{
  final String id;
  final String title;
  final String original_title;
  final String meta_title;
  final String meta_desc;
  final String overview;
  final String backdrop_path;
  final String poster_path;
  final String media_type;
  final bool adult;
  final String country;
  final String age;
  final double popularity;
  final DateTime release_date;
  final String video_url;
  final double vote_average;
  final int vote_count;
  final List<String> posters_url;
  final String trailer_url;
  final String quatily;
  final String general_duration;
  final List<String> genres;
  final List<String> subtitles;
  final List<String> translation;
  final List<String> main_actors;
  final List<String> creators;
  final String studio_id;
  final List<SeasonModel>? seasons;

  MediaModel(
  {
    required this.id,
    required this.title,
    required this.original_title,
    required this.meta_title,
    required this.meta_desc,
    required this.overview,
    required this.backdrop_path,
    required this.poster_path,
    required this.media_type,
    required this.adult,
    required this.country,
    required this.age,
    required this.popularity,
    required this.release_date,
    required this.video_url,
    required this.vote_average,
    required this.vote_count,
    required this.posters_url,
    required this.trailer_url,
    required this.quatily,
    required this.general_duration,
    required this.genres,
    required this.subtitles,
    required this.translation,
    required this.main_actors,
    required this.creators,
    required this.studio_id,
    this.seasons,
  });
}

List<MediaModel> movies = [
  MediaModel(
    id: '11',
    title: 'Bridgerton',
    original_title: 'Bridgerton',
    meta_title: 'The Great Journey - Epic Adventure',
    meta_desc: 'An epic journey across uncharted lands.',
    overview: 'A group of explorers set out on an adventure to discover uncharted territories.',
    backdrop_path: 'https://ntvb.tmsimg.com/assets/p18974714_b_h10_ao.jpg?w=960&h=540',
    poster_path: 'https://m.media-amazon.com/images/M/MV5BY2ZiODA2MGYtMmMxMi00YjlmLWFmYjktMWYyOTMwNWFkNWNkXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_QL75_UX190_CR0,0,190,281_.jpg',
    media_type: 'series',
    adult: false,
    country: 'USA',
    age: '18+',
    popularity: 8.5,
    release_date: DateTime(2022, 1, 15),
    video_url: '',
    vote_average: 8.8,
    vote_count: 1245,
    posters_url: ['https://m.media-amazon.com/images/I/A1RZ8fyr2HL._UF1000,1000_QL80_.jpg'],
    trailer_url: '/path_to_trailer.mp4',
    quatily: 'HD',
    general_duration: '45min per episode',
    genres: ['2', '4'],
    subtitles: ['English', 'Spanish'],
    translation: ['English', 'Spanish'],
    main_actors: ['2', '3'],
    creators: ['1'],
    studio_id: '1',
    seasons: [
      SeasonModel(
        id: '1',
        name: 'Season 1',
        meta_title: 'The Great Journey - Season 1',
        meta_desc: 'The beginning of an epic adventure.',
        overview: 'The group begins their journey into the unknown.',
        series_count: 2,
        general_duration: '45min per episode',
        poster_url: 'https://i.ytimg.com/vi/YtLzCI8Cxd0/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCH3F9gJj561j0AJT49wvAau-bdpA',
        status: 'Released',
        series: [
          SeriesModel(
            id: '1',
            name: 'The Adventure Begins',
            meta_title: 'The Adventure Begins',
            meta_desc: 'The first steps into the unknown.',
            overview: 'The explorers take their first steps into the wild.',
            poster_url: 'https://i.ytimg.com/vi/YtLzCI8Cxd0/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCH3F9gJj561j0AJT49wvAau-bdpA',
            duration: '45min',
            video_url: '/path_to_episode1_video.mp4',
            date: DateTime(2022, 1, 15),
            released: true,
          ),
          SeriesModel(
            id: '2',
            name: 'Into the Wilderness',
            meta_title: 'Into the Wilderness',
            meta_desc: 'The journey takes a dangerous turn.',
            overview: 'The group faces their first major challenge.',
            poster_url: 'https://pyxis.nymag.com/v1/imgs/430/8c4/c08c2b84ae32273e8c2388fb84037ef45d-bridgerton-recaps-ep-02.2x.rsocial.w600.jpg',
            duration: '45min',
            video_url: '/path_to_episode2_video.mp4',
            date: DateTime(2022, 1, 22),
            released: true,
          ),
        ],
      ),
      SeasonModel(
        id: '2',
        name: 'Season 2',
        meta_title: 'The Great Journey - Season 2',
        meta_desc: 'The journey continues with new challenges.',
        overview: 'The group faces harsher environments and internal conflicts.',
        series_count: 2,
        general_duration: '45min per episode',
        poster_url: '/path_to_season2_poster.jpg',
        status: 'Released',
        series: [
          SeriesModel(
            id: '1',
            name: 'Crossing the Desert',
            meta_title: 'Crossing the Desert',
            meta_desc: 'The explorers face a scorching desert.',
            overview: 'The group must survive the harsh desert conditions.',
            poster_url: 'https://pyxis.nymag.com/v1/imgs/101/96c/71ec8b8d433e3cafe6ace14da7cce7b681-bridgerton-s2-ep-01.2x.rsocial.w600.jpg',
            duration: '45min',
            video_url: '/path_to_episode3_video.mp4',
            date: DateTime(2023, 2, 10),
            released: true,
          ),
          SeriesModel(
            id: '2',
            name: 'The Mountain Pass',
            meta_title: 'The Mountain Pass',
            meta_desc: 'A treacherous mountain path stands in their way.',
            overview: 'The group must find a way through the perilous mountains.',
            poster_url: 'https://pyxis.nymag.com/v1/imgs/2a2/7e4/b7dc5378ae9d2e268b29d3a84e63d517c1-bridgerton-s2-ep-02.2x.rsocial.w600.jpg',
            duration: '45min',
            video_url: '/path_to_episode4_video.mp4',
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
    original_title: 'The Boys',
    meta_title: 'Mystery of the Ancient Temple - Uncovering Secrets',
    meta_desc: 'A team of archaeologists uncovers the secrets of an ancient temple.',
    overview: 'Archaeologists explore an ancient temple with dark secrets.',
    backdrop_path: 'https://m.media-amazon.com/images/S/pv-target-images/473fd8bc878799c1a035cb13c688edd9eb6d240d426abf34e0bf3c1dde95724b.jpg',
    poster_path: 'https://upload.wikimedia.org/wikipedia/uk/e/e8/The_Boys_%28poster%29.jpg',
    media_type: 'series',
    adult: false,
    country: 'UK',
    age: '18+',
    popularity: 7.9,
    release_date: DateTime(2021, 10, 1),
    video_url: '',
    vote_average: 8.2,
    vote_count: 980,
    posters_url: ['https://m.media-amazon.com/images/M/MV5BYTY2ZjYyNGUtZGVkZS00MDNhLWIwMjMtZDk4MmQ5ZWI0NTY4XkEyXkFqcGdeQXVyMTY3MDE5MDY1._V1_QL75_UY281_CR18,0,190,281_.jpg'],
    trailer_url: '/path_to_trailer2.mp4',
    quatily: 'HD',
    general_duration: '50min per episode',
    genres: ['4', '5'],
    subtitles: ['English', 'French'],
    translation: ['English', 'French'],
    main_actors: ['1', '5'],
    creators: ['1',],
    studio_id: '2',
    seasons: [
      SeasonModel(
        id: 'season1',
        name: 'Season 1',
        meta_title: 'Mystery of the Ancient Temple - Season 1',
        meta_desc: 'Unveiling the temple\'s dark secrets.',
        overview: 'The team discovers the entrance to the ancient temple.',
        series_count: 2,
        general_duration: '50min per episode',
        poster_url: '/path_to_season1_poster2.jpg',
        status: 'Released',
        series: [
          SeriesModel(
            id: 'episode1',
            name: 'The Discovery',
            meta_title: 'The Discovery',
            meta_desc: 'The team uncovers the entrance to the temple.',
            overview: 'Archaeologists find the entrance to the ancient temple.',
            poster_url: '/path_to_episode1_poster2.jpg',
            duration: '50min',
            video_url: '/path_to_episode5_video.mp4',
            date: DateTime(2021, 10, 1),
            released: true,
          ),
          SeriesModel(
            id: 'episode2',
            name: 'The First Trial',
            meta_title: 'The First Trial',
            meta_desc: 'The team faces the temple\'s first challenge.',
            overview: 'The archaeologists encounter the temple\'s first booby trap.',
            poster_url: '/path_to_episode2_poster2.jpg',
            duration: '50min',
            video_url: '/path_to_episode6_video.mp4',
            date: DateTime(2021, 10, 8),
            released: true,
          ),
        ],
      ),
      SeasonModel(
        id: 'season2',
        name: 'Season 2',
        meta_title: 'Mystery of the Ancient Temple - Season 2',
        meta_desc: 'Diving deeper into the temple\'s mysteries.',
        overview: 'The team ventures further into the temple, facing greater dangers.',
        series_count: 2,
        general_duration: '50min per episode',
        poster_url: '/path_to_season2_poster2.jpg',
        status: 'Released',
        series: [
          SeriesModel(
            id: 'episode1',
            name: 'The Hidden Chamber',
            meta_title: 'The Hidden Chamber',
            meta_desc: 'A secret chamber is discovered.',
            overview: 'The team finds a hidden chamber with ancient artifacts.',
            poster_url: '/path_to_episode7_poster.jpg',
            duration: '50min',
            video_url: '/path_to_episode7_video.mp4',
            date: DateTime(2022, 1, 5),
            released: true,
          ),
          SeriesModel(
            id: 'episode2',
            name: 'The Final Puzzle',
            meta_title: 'The Final Puzzle',
            meta_desc: 'The team solves the temple\'s final puzzle.',
            overview: 'The archaeologists work together to solve the temple\'s last challenge.',
            poster_url: '/path_to_episode8_poster.jpg',
            duration: '50min',
            video_url: '/path_to_episode8_video.mp4',
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
    original_title: "The Shawshank Redemption",
    meta_title: "Shawshank Redemption",
    meta_desc: "Two imprisoned men bond over a number of years.",
    overview: "Andy Dufresne, a successful banker, is imprisoned for the murders of his wife and her lover, and he is sentenced to life imprisonment at the Shawshank prison.",
    backdrop_path: "/path1.jpg",
    poster_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbECd2GUCQtWhDUu7b0R1PoHGRbY5OC_mISw&s",
    media_type: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 95.0,
    release_date: DateTime(1994, 9, 23),
    video_url: "https://www.youtube.com/watch?v=6hB3S9bIaco",
    vote_average: 9.3,
    vote_count: 22000,
      posters_url: ["https://www.tallengestore.com/cdn/shop/products/Movie_Poster_Art_-_The_Shawshank_Redemption_-_Tallenge_Hollywood_Poster_Collection.jpg?v=1577959686"],
    trailer_url: "https://www.youtube.com/watch?v=6hB3S9bIaco",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '1',
  ),
  MediaModel(
    id: "2",
    title: "The Godfather",
    original_title: "The Godfather",
    meta_title: "Godfather",
    meta_desc: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
    overview: "The Godfather is an American crime film directed by Francis Ford Coppola.",
    backdrop_path: "/path2.jpg",
    poster_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH9NDr86lyRrd7hZel8g9d3cYr0Qwxs9xQ5g&s",
    media_type: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 92.0,
    release_date: DateTime(1972, 3, 24),
    video_url: "https://www.youtube.com/watch?v=sY1S34973zA",
    vote_average: 9.2,
    vote_count: 19000,
    posters_url: ["https://i.ebayimg.com/images/g/T7gAAOSwc6ti7FM7/s-l400.jpg"],
    trailer_url: "https://www.youtube.com/watch?v=sY1S34973zA",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '2',
  ),
  MediaModel(
    id: "3",
    title: "The Dark Knight",
    original_title: "The Dark Knight",
    meta_title: "Dark Knight",
    meta_desc: "Batman faces the Joker, a criminal mastermind who wants to plunge Gotham City into anarchy.",
    overview: "Batman raises the stakes in his war on crime with the help of Lt. Jim Gordon and District Attorney Harvey Dent.",
    backdrop_path: "/path3.jpg",
    poster_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3ekE6Hhz9gvIbiFSUPxt-FyAh4zXTXX0bjQ&s",
    media_type: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 98.0,
    release_date: DateTime(2008, 7, 18),
    video_url: "https://www.youtube.com/watch?v=EXeTwQWrcwY",
    vote_average: 9.0,
    vote_count: 25000,
    posters_url: ["https://filmartgallery.com/cdn/shop/products/The-Dark-Knight-Vintage-Movie-Poster-Original-1-Sheet-27x41_f88e9b5a-9955-487f-81d9-b0fae8dbcffe.jpg?v=1677042170"],
    trailer_url: "https://www.youtube.com/watch?v=EXeTwQWrcwY",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '3',
  ),
  MediaModel(
    id: "4",
    title: "Pulp Fiction",
    original_title: "Pulp Fiction",
    meta_title: "Pulp Fiction",
    meta_desc: "The lives of two mob hitmen, a boxer, a gangster, and his wife intertwine in four tales of violence and redemption.",
    overview: "Pulp Fiction is an American neo-noir black comedy crime film written and directed by Quentin Tarantino.",
    backdrop_path: "/path4.jpg",
    poster_path: "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    media_type: "movie",
    adult: true,
    country: "USA",
    age: "16+",
    popularity: 90.0,
    release_date: DateTime(1994, 10, 14),
    video_url: "https://www.youtube.com/watch?v=s7EdQ4FqbhY",
    vote_average: 8.9,
    vote_count: 21000,
    posters_url: ["https://image.tmdb.org/t/p/original/wZbnRMarWnO4DJRisOaK4QEg1tl.jpg"],
    trailer_url: "https://www.youtube.com/watch?v=s7EdQ4FqbhY",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '4',
  ),
  MediaModel(
    id: "5",
    title: "Schindler's List",
    original_title: "Schindler's List",
    meta_title: "Schindler's List",
    meta_desc: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce.",
    overview: "Schindler's List is an American epic historical drama film directed and produced by Steven Spielberg.",
    backdrop_path: "/path5.jpg",
    poster_path: "https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
    media_type: "movie",
    adult: true,
    country: "USA",
    age: "16+",
    popularity: 85.0,
    release_date: DateTime(1993, 12, 15),
    video_url: "https://www.youtube.com/watch?v=gG22XNhtnoY",
    vote_average: 8.9,
    vote_count: 20000,
    posters_url: ["https://filmartgallery.com/cdn/shop/products/Schindlers-List-Vintage-Movie-Poster-Original-1-Sheet-27x41-6807_92bfcd15-9a90-439a-ae24-6bc0387db872.jpg?v=1663221618"],
    trailer_url: "https://www.youtube.com/watch?v=gG22XNhtnoY",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '5',
  ),
  MediaModel(
    id: "6",
    title: "The Lord of the Rings: The Return of the King",
    original_title: "The Lord of the Rings: The Return of the King",
    meta_title: "LOTR: Return of the King",
    meta_desc: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
    overview: "The final confrontation between the forces of good and evil fighting for control of the future of Middle-earth.",
    backdrop_path: "/path6.jpg",
    poster_path: "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    media_type: "movie",
    adult: false,
    country: "New Zealand",
    age: "16+",
    popularity: 88.0,
    release_date: DateTime(2003, 12, 17),
    video_url: "https://www.youtube.com/watch?v=r5X-hFf6Bwo",
    vote_average: 8.9,
    vote_count: 21000,
    posters_url: ["https://alternativemovieposters.com/wp-content/uploads/2022/10/PhantomCity_ReturnOfTheKing.jpg"],
    trailer_url: "https://www.youtube.com/watch?v=r5X-hFf6Bwo",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '1',
  ),
  MediaModel(
    id: "7",
    title: "Fight Club",
    original_title: "Fight Club",
    meta_title: "Fight Club",
    meta_desc: "An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.",
    overview: "Fight Club is a 1999 American film directed by David Fincher, based on the 1996 novel of the same name by Chuck Palahniuk.",
    backdrop_path: "/path7.jpg",
    poster_path: "https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg",
    media_type: "movie",
    adult: true,
    country: "USA",
    age: "16+",
    popularity: 87.0,
    release_date: DateTime(1999, 10, 15),
    video_url: "https://www.youtube.com/watch?v=SUXWAEX2jlg",
    vote_average: 8.8,
    vote_count: 21000,
    posters_url: ["https://m.media-amazon.com/images/I/61bocjnue+L._AC_UF894,1000_QL80_.jpg"],
    trailer_url: "https://www.youtube.com/watch?v=SUXWAEX2jlg",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '2',
  ),
  MediaModel(
    id: "8",
    title: "Forrest Gump",
    original_title: "Forrest Gump",
    meta_title: "Forrest Gump",
    meta_desc: "The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75.",
    overview: "Forrest Gump is a 1994 American comedy-drama film directed by Robert Zemeckis and written by Eric Roth.",
    backdrop_path: "/path8.jpg",
    poster_path: "https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg",
    media_type: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 85.0,
    release_date: DateTime(1994, 7, 6),
    video_url: "https://www.youtube.com/watch?v=bLvqoHBptjg",
    vote_average: 8.8,
    vote_count: 21000,
    posters_url: ["https://product-image.juniqe-production.juniqe.com/media/catalog/product/seo-cache/x800/92/376/92-376-101P/Forrest-Gump-Naxart-Poster.jpg"],
    trailer_url: "https://www.youtube.com/watch?v=bLvqoHBptjg",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '3',
  ),
  MediaModel(
    id: "9",
    title: "Inception",
    original_title: "Inception",
    meta_title: "Inception",
    meta_desc: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
    overview: "Inception is a 2010 science fiction action film written and directed by Christopher Nolan.",
    backdrop_path: "/path9.jpg",
    poster_path: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_QL75_UX190_CR0,0,190,281_.jpg",
    media_type: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 94.0,
    release_date: DateTime(2010, 7, 16),
    video_url: "https://www.youtube.com/watch?v=YoHD9XEInc0",
    vote_average: 8.7,
    vote_count: 22000,
    posters_url: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuNMFrEDOai-0LAtswwcgJnS-yyMzB99EPZw&s"],
    trailer_url: "https://www.youtube.com/watch?v=YoHD9XEInc0",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '4',
  ),
  MediaModel(
    id: "10",
    title: "The Matrix",
    original_title: "The Matrix",
    meta_title: "Matrix",
    meta_desc: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
    overview: "The Matrix is a 1999 American science fiction action film written and directed by the Wachowskis.",
    backdrop_path: "/path10.jpg",
    poster_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfSjSWOCaw5dnDL2GT1zFd9RMCgUGw5Q2Cfg&s",
    media_type: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 90.0,
    release_date: DateTime(1999, 3, 31),
    video_url: "https://www.youtube.com/watch?v=vKQi3bBA1y8",
    vote_average: 8.7,
    vote_count: 21000,
    posters_url: ["https://static.posters.cz/image/750/%D0%9F%D0%BB%D0%B0%D0%BA%D0%B0%D1%82%D0%B8/the-matrix-resurrections-the-choice-is-yours-i126664.jpg"],
    trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1y8",
    quatily: "HD",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '5',
  ),

];

List<MediaModel> newFilms = [
  MediaModel(
    id: "1",
    title: "Eclipse",
    original_title: "Eclipse",
    meta_title: "Eclipse",
    meta_desc: "A group of astronauts encounters a mysterious phenomenon on a mission to the moon.",
    overview: "In 2024, a team of astronauts embarks on a mission to explore a lunar eclipse, only to uncover a force that threatens to alter the course of humanity.",
    backdrop_path: "https://i.ytimg.com/vi/lLaYsyFU8UE/sddefault.jpg",
    poster_path: "https://m.media-amazon.com/images/M/MV5BZjk0Y2U3MzItNDA5OC00YTk1LTlkZDMtYTQ5YjFhNzBmMTI0XkEyXkFqcGdeQXVyMzY1NzU1OTU@._V1_QL75_UY281_CR5,0,190,281_.jpg",
    media_type: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 85.0,
    release_date: DateTime(2024, 4, 14),
    video_url: "https://www.youtube.com/watch?v=sampleEclipseTrailer",
    vote_average: 8.5,
    vote_count: 15000,
    posters_url: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaAjvGrhdJVes3qQyrKspjt9n1WzeeTed9FA&s"],
    trailer_url: "https://www.youtube.com/watch?v=sampleEclipseTrailer",
    quatily: "4K",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '1',
  ),
  MediaModel(
    id: "2",
    title: "Deadpool & Wolverine",
    original_title: "Deadpool & Wolverine",
    meta_title: "Deadpool & Wolverine",
    meta_desc: "The ultimate team-up between the Merc with a Mouth and the adamantium-clawed mutant as they face a new threat.",
    overview: "In this highly anticipated crossover, Deadpool and Wolverine must join forces to stop a powerful enemy threatening the entire Marvel Universe. Expect explosive action, sharp wit, and the return of fan-favorite characters.",
    backdrop_path: "https://i.ytimg.com/vi/73_1biulkYk/maxresdefault.jpg",
    poster_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbCwIcqHVA4Kd9jsfutxIcVdxHe-fSVi40PQ&s",
    media_type: "movie",
    adult: true,
    country: "USA",
    age: "16+",
    popularity: 98.5,
    release_date: DateTime(2024, 11, 10),
    video_url: "https://www.youtube.com/watch?v=sampleDeadpoolWolverineTrailer",
    vote_average: 8.7,
    vote_count: 25000,
    posters_url: ["https://m.media-amazon.com/images/I/81-nnaHRgfL.jpg"],
    trailer_url: "https://www.youtube.com/watch?v=sampleDeadpoolWolverineTrailer",
    quatily: "4K",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '3',
  ),
  MediaModel(
    id: "3",
    title: "It Ends with Us",
    original_title: "It Ends with Us",
    meta_title: "It Ends with Us",
    meta_desc: "A gripping drama based on the bestselling novel by Colleen Hoover, exploring love, pain, and the complexities of relationships.",
    overview: "Adapted from Colleen Hoover's bestselling novel, this emotional drama delves into the life of Lily Bloom as she navigates through her complicated past and tumultuous present. As Lily confronts the difficult decisions she must make, the story unfolds with powerful themes of love, resilience, and heartbreak.",
    backdrop_path: "https://i.ytimg.com/vi/DLET_u31M4M/hqdefault.jpg?v=664603f1",
    poster_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewXYy0R6TAHNJDzIN4sxejxT7V5EAkL4FgQ&s",
    media_type: "movie",
    adult: false,
    country: "USA",
    age: "16+",
    popularity: 90.0,
    release_date: DateTime(2024, 8, 25),
    video_url: "https://www.youtube.com/watch?v=sampleItEndsWithUsTrailer",
    vote_average: 8.2,
    vote_count: 15000,
    posters_url: ["https://i.ebayimg.com/images/g/EL8AAOSwIIZmbAE5/s-l1200.jpg"],
    trailer_url: "https://www.youtube.com/watch?v=sampleItEndsWithUsTrailer",
    quatily: "4K",
      general_duration:"1:37",
    genres: ['1','2'],
    subtitles: ['ua','uk'],
    translation: ['ua','uk'],
    main_actors: ['1', '2','3','4', '5'],
    creators: ['1'],
    studio_id: '5',
  ),
];
