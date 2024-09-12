import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/genre_model.dart';

class GenreService{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> saveGenresToUserPreferences(String userId, List<GenreModel> genres) async {
    try {
      List<Map<String, dynamic>> genreMaps = genres.map((genre) => genre.toMap()).toList();

      await _firestore.collection('users').doc(userId).update({
        'preferences': genreMaps,
      });

    } catch (e) {
      rethrow;
    }
  }

  static Future<void> saveGenresToCurrentUser(List<GenreModel> genres) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        return;
      }

      String userId = currentUser.uid;
      List<Map<String, dynamic>> genreMaps = genres.map((genre) => genre.toMap()).toList();

      await _firestore.collection('users').doc(userId).update({
        'preferences': genreMaps,
      });

    } catch (e) {
      rethrow;
    }
  }

  static Future<List<GenreModel>> getGenresFromCurrentUser() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        return [];
      }

      String userId = currentUser.uid;
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists && userDoc.data() != null) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        if (userData.containsKey('preferences')) {
          List<dynamic> genreMaps = userData['preferences'];

          List<GenreModel> genres = genreMaps.map((genreData) {
            return GenreModel(
              id: genreData['id'],
              name: genreData['name'],
              meta_title: genreData['meta_title'],
              meta_desc: genreData['meta_desc'],
              description: genreData['description'],
            );
          }).toList();

          return genres;
        }
      }

      return [];
    } catch (e) {
      rethrow;
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
      rethrow;
    }
  }

}