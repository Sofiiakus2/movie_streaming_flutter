import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_sctreaming/models/user_model.dart';

class ProfileService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserModel> getMainPersonalInfo() async{
    try{
      User? user = _auth.currentUser;

      UserModel currentUser = UserModel(
        name: user?.displayName ?? 'Unknown',
        email: user?.email ?? 'No email',
      );

      return currentUser;
    }catch(e){
      throw e;
    }
  }
}