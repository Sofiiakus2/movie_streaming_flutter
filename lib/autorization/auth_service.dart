import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/media_model.dart';

class AuthService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static void saveLoginState(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userId', userId);
  }

  static Future<void> saveMediaModel(MediaModel media) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String mediaJson = jsonEncode(media.toMap());

    await prefs.setString('mediaModel', mediaJson);
  }

  static Future<MediaModel?> getMediaModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? mediaJson = prefs.getString('mediaModel');

    if (mediaJson != null) {
      Map<String, dynamic> mediaMap = jsonDecode(mediaJson);
      return MediaModel.fromMap(mediaMap);
    }

    return null;
  }

  static Future<void> removeMediaModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('mediaModel');
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