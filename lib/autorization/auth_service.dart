import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static void saveLoginState(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userId', userId);
  }


  static Future<void> signOut() async {
    try {
      await _auth.signOut();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('isLoggedIn');
      await prefs.remove('userId');
    } catch (e) {
      rethrow;
    }
  }


}