import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/people_model.dart';

class PeopleService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> savePeopleToDB(List<People> peopleList) async {
    try {
      for (People person in peopleList) {
        await _firestore.collection('people').doc(person.id).set(person.toMap());
      }
    } catch (e) {
      rethrow;
    }
  }
}
