import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/media_model.dart';

class UserService{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<bool> isInWatchlist(String mediaId) async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(currentUser.uid).get();

      if (userDoc.exists) {
        List<dynamic> watchlist = userDoc.get('watchlist') ?? [];

        for (var item in watchlist) {
          if (item['id'] == mediaId) {
            return true; // Медіа вже в watchlist
          }
        }
      }
    }
    return false;
  }

  static Future<void> addToWatchlist(MediaModel media) async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      await _firestore.collection('users').doc(currentUser.uid).update({
        'watchlist': FieldValue.arrayUnion([media.toMap()]),
      });
    }
  }

  static Future<void> removeFromWatchlist(MediaModel media) async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      await _firestore.collection('users').doc(currentUser.uid).update({
        'watchlist': FieldValue.arrayRemove([media.toMap()]),
      });
    }
  }
}