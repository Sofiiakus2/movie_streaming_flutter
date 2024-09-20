

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:movie_sctreaming/services/user_service.dart';
// Future<void> handleBackgroundMessage(RemoteMessage message) async{
//   await Firebase.initializeApp();
//   if (message.notification != null) {
//     print('===================');
//     print('Message: ${message.notification?.title}');
//     // if (message.data['date'] != 'null') {
//     //   DateTime dateTime = DateTime.parse(message.data['date']);
//     //   // NotificationService.showNotification(
//     //   //     title: message.notification!.title ?? 'No title',
//     //   //     body: message.notification!.body ?? 'No body',
//     //   //     scheduled: true,
//     //   //     scheduledDateTime: dateTime);
//     // } else {
//     //   // NotificationService.showNotification(
//     //   //   title: message.notification!.title ?? 'No title',
//     //   //   body: message.notification!.body ?? 'No body',
//     //   // );
//     // }
//   }
// }


class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    UserService.saveTokenToUserCollection(fcmToken!);
  //  print(fcmToken);
  }
}