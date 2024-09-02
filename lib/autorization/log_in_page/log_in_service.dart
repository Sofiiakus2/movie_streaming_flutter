import 'package:firebase_auth/firebase_auth.dart';

class LogInService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print('Error signing in: $e');
      return false;
    }
  }
}