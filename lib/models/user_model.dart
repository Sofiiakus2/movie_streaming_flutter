import 'genre_model.dart';
import 'media_model.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final DateTime date_of_birth;
  final String gender;
  final String? profile_picture_url;
  final List<MediaModel>? watchlist;
  final List<MediaModel>? favourites;
  final List<MediaModel>? watch_story;
  final List<GenreModel>? preferences;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.date_of_birth,
    required this.gender,
    this.profile_picture_url,
    this.watchlist,
    this.favourites,
    this.watch_story,
    this.preferences
});
}

UserModel userExample = UserModel(
  id: '12345',
  name: 'John Doe',
  email: 'johndoe@example.com',
  date_of_birth: DateTime(1990, 5, 15),
  gender: 'Male',
);