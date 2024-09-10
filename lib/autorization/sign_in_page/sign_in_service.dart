import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_sctreaming/models/user_model.dart';

import '../auth_service.dart';

class SignInService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static bool checkCorrectEmailInput(String email){
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );

    if (emailRegExp.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkCorrectPasswordInput(String password){
    return password.length >= 6;
  }

  static bool checkCorrectPasswordConfirm(String password, String confirmPassword){
    return password == confirmPassword;
  }

  static Future<void> signUp(UserModel newUser) async{
    try{
      AuthService.saveFirstEnterState();
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: newUser.email, password: newUser.password!);
      newUser.id = userCredential.user?.uid;
      updateDisplayName(newUser.name);
      createNewUserInDB(newUser);
    }catch(e){
      print(e);
    }
  }

  static Future<void> updateDisplayName(String name) async{
    try{
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateProfile(displayName: name);
        print('Display name updated successfully.');
      } else {
        print('No user is currently signed in.');
      }
    }catch(e){

    }
  }

  static Future<void> createNewUserInDB (UserModel newUser) async{
    try {
      await _firestore.collection('users').doc(newUser.id).set({
        'name': newUser.name,
        'email': newUser.email,
      });
    } catch (e, stackTrace) {
      print('Error adding user to Firestore: $e');
      print('Stack trace: $stackTrace');
    }
  }
}

