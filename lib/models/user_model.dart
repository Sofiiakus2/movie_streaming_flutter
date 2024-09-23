import 'package:cloud_firestore/cloud_firestore.dart';

import 'genre_model.dart';
import 'media_model.dart';

class UserModel {
  String? id;
  final String name;
  final String email;
  final String? password;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? profilePictureUrl;
  final List<MediaModel>? watchlist;
  final List<MediaModel>? watchStory;
  final List<GenreModel>? preferences;
  final List<String>? subscriptions;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.dateOfBirth,
    this.gender,
    this.profilePictureUrl,
    this.watchlist,
    this.watchStory,
    this.preferences,
    this.password,
    this.subscriptions,
});

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    Timestamp timestamp = data['date_of_birth'];
    DateTime dateTime = timestamp.toDate();

    return UserModel(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      password: data['password'],
      dateOfBirth: dateTime,
      gender: data['gender'],
      profilePictureUrl: data['profile_picture_url'],
      watchlist: data['watchlist'] != null
          ? (data['watchlist'] as List)
          .map((item) => MediaModel.fromMap(item))
          .toList()
          : null,
      watchStory: data['watch_story'] != null
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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'profile_picture_url': profilePictureUrl,
      'watchlist': watchlist?.map((item) => item.toMap()).toList(),
      'watch_story': watchStory?.map((item) => item.toMap()).toList(),
      'preferences': preferences?.map((item) => item.toMap()).toList(),
    };
  }
}

UserModel userExample = UserModel(
  id: '12345',
  name: 'John Doe',
  email: 'johndoe@example.com',
  dateOfBirth: DateTime(1990, 5, 15),
  gender: 'Male',
);