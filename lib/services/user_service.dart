import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/media_model.dart';
import '../models/user_model.dart';

class UserService{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> addToWatchStory(MediaModel media) async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      await _firestore.collection('users').doc(currentUser.uid).update({
        'watch_story': FieldValue.arrayUnion([media.toMap()]),
      });
    }
  }

  static Future<bool> isInWatchlist(String mediaId) async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(currentUser.uid).get();

      if (userDoc.exists) {
        List<dynamic> watchlist = userDoc.get('watchlist') ?? [];

        for (var item in watchlist) {
          if (item['id'] == mediaId) {
            return true;
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


  static Future<UserModel?> getCurrentUser() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        return null;
      }

      String userId = currentUser.uid;
      DocumentSnapshot<Map<String, dynamic>> userDoc =
      await _firestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        return null;
      }

      Map<String, dynamic>? userData = userDoc.data();
      if (userData == null) {
        return null;
      }

      return UserModel.fromMap(userData, userId);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateUser(UserModel user) async {
    User? currentUser = _auth.currentUser;
    final userRef = _firestore.collection('users').doc(currentUser?.uid);

    await userRef.update({
      "name": user.name,
      "email": user.email,
      "gender": user.gender ?? '',
      "date_of_birth":user.dateOfBirth,
    });
  }

  static Future<void> saveTokenToUserCollection(String token) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        DocumentReference userDoc = FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid);

        await userDoc.update({
          'token': token,
        });

        print('Токен успішно збережено');
      } else {
        print('Користувач не авторизований');
      }
    } catch (e) {
      print('Помилка при збереженні токена: $e');
    }
  }

}