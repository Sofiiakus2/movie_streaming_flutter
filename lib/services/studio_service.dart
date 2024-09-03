import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/studio_model.dart';

class StudioService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> saveStudiosToDB(List<StudioModel> studios) async {
    try {
      for (StudioModel studio in studios) {
        await _firestore.collection('studios').doc(studio.id).set(studio.toMap());
      }
    } catch (e) {
      print('Error saving studios to Firestore: $e');
    }
  }
}
