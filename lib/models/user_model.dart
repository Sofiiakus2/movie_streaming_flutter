import 'package:cloud_firestore/cloud_firestore.dart';

import 'genre_model.dart';
import 'media_model.dart';

class UserModel {
  String? id;
  final String name;
  final String email;
  final String? password;
  final DateTime? date_of_birth;
  final String? gender;
  final String? profile_picture_url;
  final List<MediaModel>? watchlist;
  final List<MediaModel>? watch_story;
  final List<GenreModel>? preferences;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.date_of_birth,
    this.gender,
    this.profile_picture_url,
    this.watchlist,
    this.watch_story,
    this.preferences,
    this.password,
});

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    Timestamp timestamp = data['date_of_birth'];
    DateTime dateTime = timestamp.toDate();

    return UserModel(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      password: data['password'],
      date_of_birth: dateTime,
      gender: data['gender'],
      profile_picture_url: data['profile_picture_url'],
      watchlist: data['watchlist'] != null
          ? (data['watchlist'] as List)
          .map((item) => MediaModel.fromMap(item))
          .toList()
          : null,
      watch_story: data['watch_story'] != null
          ? (data['watch_story'] as List)
          .map((item) => MediaModel.fromMap(item))
          .toList()
          : null,
      preferences: data['preferences'] != null
          ? (data['preferences'] as List)
          .map((item) => GenreModel.fromMap(item))
          .toList()
          : null,
    );
  }

  // Конвертація UserModel в Map для Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'date_of_birth': date_of_birth?.toIso8601String(),
      'gender': gender,
      'profile_picture_url': profile_picture_url,
      'watchlist': watchlist?.map((item) => item.toMap()).toList(),
      'watch_story': watch_story?.map((item) => item.toMap()).toList(),
      'preferences': preferences?.map((item) => item.toMap()).toList(),
    };
  }
}

UserModel userExample = UserModel(
  id: '12345',
  name: 'John Doe',
  email: 'johndoe@example.com',
  date_of_birth: DateTime(1990, 5, 15),
  gender: 'Male',
);