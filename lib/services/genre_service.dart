import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/genre_model.dart';

class GenreService{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> saveGenresToDB(List<GenreModel> genres) async {
    try {
      for (GenreModel genre in genres) {
        await _firestore.collection('genres').doc(genre.id).set(genre.toMap());
      }
    } catch (e) {
      print('Error saving genres to Firestore: $e');
    }
  }
}