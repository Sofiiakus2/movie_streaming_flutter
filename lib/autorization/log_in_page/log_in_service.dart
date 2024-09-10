import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_sctreaming/autorization/auth_service.dart';

class LogInService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      AuthService.saveLoginState(userCredential.user!.uid);
      
      return true;
    } catch (e) {
      print('Error signing in: $e');
      return false;
    }
  }

}