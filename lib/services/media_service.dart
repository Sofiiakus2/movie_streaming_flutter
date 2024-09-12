import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/media_model.dart';

class MediaService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> saveMoviesToFirestore(List<MediaModel> movies) async {
    try {
      WriteBatch batch = _firestore.batch();

      for (MediaModel movie in movies) {
        DocumentReference docRef = _firestore.collection('movies').doc(movie.id);
        batch.set(docRef, movie.toMap());
      }

      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<MediaModel>> getUserWatchList() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null){
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(currentUser.uid).get();
      if (userDoc.exists && userDoc.data() != null){
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        if (userData.containsKey('watchlist')){
          List<dynamic> watchlistData = userData['watchlist'];

          List<MediaModel> watchlist = watchlistData.map((item) {
            return MediaModel.fromMap(item);
          }).toList();

          return watchlist.reversed.toList();
        }
      }
    }
    return [];
  }

  static Future<List<MediaModel>> getMoviesFromDB() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('movies').get();

      List<MediaModel> movies = querySnapshot.docs.map((doc) {
        return MediaModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }


}
