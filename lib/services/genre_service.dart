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

  static Future<List<GenreModel>> getGenresFromDB() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('genres').get();
      List<GenreModel> genres = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return GenreModel(
          id: data['id'],
          name: data['name'],
          meta_title: data['meta_title'],
          meta_desc: data['meta_desc'],
          description: data['description'],
        );
      }).toList();

      return genres;
    } catch (e) {
      print('Error getting genres from Firestore: $e');
      return [];
    }
  }

}