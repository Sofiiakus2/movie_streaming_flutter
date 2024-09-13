import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_sctreaming/autorization/auth_service.dart';

class LogInService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      AuthService.saveLoginState(userCredential.user!.uid);
      
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> checkPreferences() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(currentUser.uid).get();

      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('preferences')) {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }


}