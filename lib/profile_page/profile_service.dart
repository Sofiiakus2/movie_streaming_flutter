import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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

  static Route createRoute(Widget NextPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NextPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Починає анімацію з правого боку
        const end = Offset.zero; // Кінцева позиція
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}