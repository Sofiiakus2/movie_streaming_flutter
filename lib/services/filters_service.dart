import 'package:cloud_firestore/cloud_firestore.dart';

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

      print(countries);
      return countries.toList();
    } catch (e) {
      print('Error fetching countries: $e');
      return [];
    }
  }

  static Future<List<int>> getYearsFromMovies() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('movies').get();

      // Ініціалізувати множину для зберігання унікальних років
      Set<int> years = {};

      // Проходити через всі документи і зберігати значення 'release_date' в множину
      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        if (data.containsKey('release_date') && data['release_date'] is String) {
          String releaseDateString = data['release_date'] as String;

          // Спробувати парсити рядок дати і витягти рік
          try {
            DateTime releaseDate = DateTime.parse(releaseDateString);
            years.add(releaseDate.year);
          } catch (e) {
            print('Error parsing date: $releaseDateString');
          }
        }
      }

      // Перетворити множину в список і повернути його
      return years.toList()..sort(); // Сортувати за зростанням
    } catch (e) {
      print('Error fetching years: $e');
      return [];
    }
  }

  static Future<List<MediaModel>> getMoviesFromDBWithFilters({
    Set<String>? genres,
    String? title,
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

    QuerySnapshot querySnapshot = await query.get();

    List<MediaModel> movies = querySnapshot.docs.map((doc) {
      return MediaModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();

    return movies;
  }


}