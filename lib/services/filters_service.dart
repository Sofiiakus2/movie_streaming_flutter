import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/media_model.dart';

class FiltersService{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<String>> getCountriesFromMovies() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('movies').get();

      Set<String> countries = {};

      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        if (data.containsKey('country') && data['country'] is String) {
          countries.add(data['country'] as String);
        }
      }

      return countries.toList();
    } catch (e) {
      print('Error fetching countries: $e');
      return [];
    }
  }

  static Future<List<int>> getYearsFromMovies() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('movies').get();

      Set<int> years = {};

      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        if (data.containsKey('release_date') && data['release_date'] is String) {
          String releaseDateString = data['release_date'] as String;

          try {
            DateTime releaseDate = DateTime.parse(releaseDateString);
            years.add(releaseDate.year);
          } catch (e) {
            print('Error parsing date: $releaseDateString');
          }
        }
      }

      return years.toList()..sort();
    } catch (e) {
      print('Error fetching years: $e');
      return [];
    }
  }

  static Future<List<MediaModel>> getMoviesFromDBWithFilters({
    Set<String>? genres,
    String? title,
    List<String>? countries,
    List<int>? years,
  }) async {
    Query query = _firestore.collection('movies');

    if (genres != null && genres.isNotEmpty) {
      query = query.where('genres', arrayContainsAny: genres.toList());
    }

    if (title != null && title.isNotEmpty) {
      String lowerCaseTitle = title.toLowerCase();
      query = query
          .orderBy('meta_title')
          .startAt([lowerCaseTitle])
          .endAt([lowerCaseTitle + '\uf8ff']);
    }

    if (countries != null && countries.isNotEmpty) {
      query = query.where('country', whereIn: countries);
    }

    QuerySnapshot querySnapshot = await query.get();

    List<MediaModel> movies = querySnapshot.docs.map((doc) {
      return MediaModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();

    if (years != null && years.isNotEmpty) {
      print('Filtering movies by years: $years');
      movies = movies.where((movie) {
        print('Movie release year: ${movie.release_date.year}');
        return years.contains(movie.release_date.year);
      }).toList();
    }



    return movies;
  }



}