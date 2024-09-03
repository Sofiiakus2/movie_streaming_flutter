import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/media_model.dart';

class MediaService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> saveMoviesToFirestore(List<MediaModel> movies) async {
    try {
      WriteBatch batch = _firestore.batch();

      for (MediaModel movie in movies) {
        DocumentReference docRef = _firestore.collection('movies').doc(movie.id);
        batch.set(docRef, movie.toMap());
      }

      await batch.commit();
      print('Movies saved successfully');
    } catch (e) {
      print('Error saving movies: $e');
    }
  }

  static Future<List<MediaModel>> getMoviesFromDB() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('movies').get();

      List<MediaModel> movies = querySnapshot.docs.map((doc) {
        return MediaModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      return movies;
    } catch (e) {
      print('Error fetching movies: $e');
      return [];
    }
  }
}
