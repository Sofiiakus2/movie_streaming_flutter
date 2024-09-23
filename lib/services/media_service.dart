import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../models/comment_model.dart';
import '../models/media_model.dart';

class MediaService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> saveMoviesToFirestore(List<MediaModel> movies) async {
    try {
      WriteBatch batch = _firestore.batch();

      for (MediaModel movie in movies) {
        DocumentReference docRef = _firestore.collection('movies').doc(movie.id);
        batch.set(docRef, movie.toMap());
      }

      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<MediaModel>> getUserWatchList() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null){
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(currentUser.uid).get();
      if (userDoc.exists && userDoc.data() != null){
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        if (userData.containsKey('watchlist')){
          List<dynamic> watchlistData = userData['watchlist'];

          List<MediaModel> watchlist = watchlistData.map((item) {
            return MediaModel.fromMap(item);
          }).toList();

          return watchlist.reversed.toList();
        }
      }
    }
    return [];
  }

  static Future<List<MediaModel>> getUserWatchStory() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null){
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(currentUser.uid).get();
      if (userDoc.exists && userDoc.data() != null){
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        if (userData.containsKey('watch_story')){
          List<dynamic> watchlistData = userData['watch_story'];

          List<MediaModel> watchlist = watchlistData.map((item) {
            return MediaModel.fromMap(item);
          }).toList();

          return watchlist.reversed.toList();
        }
      }
    }
    return [];
  }

  static Future<List<MediaModel>> getMoviesFromDB() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('movies').get();

      List<MediaModel> movies = querySnapshot.docs.map((doc) {
        return MediaModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> addCommentToMovie(String movieId, String text) async {
    try {
      var uuid = const Uuid();
      String commentId = uuid.v4();

      CommentModel comment = CommentModel(
          id: commentId,
          authorId: _auth.currentUser!.uid,
          text: text,
          date: DateTime.now());

      await _firestore.collection('movies').doc(movieId).update({
        'comments': FieldValue.arrayUnion([comment.toMap()..['id'] = commentId])
      });

    } catch (e) {
      rethrow;
    }
  }

  static Future<void> addMovieToSubscriptions(String movieId) async {
    try {
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        await _firestore.collection('users').doc(currentUser.uid).update({
          'subscriptions': FieldValue.arrayUnion([movieId]),
        });

      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<CommentModel>> getMovieComments(String movieId) async{
    DocumentSnapshot movieDoc = await FirebaseFirestore.instance
        .collection('movies')
        .doc(movieId)
        .get();

    if (movieDoc.exists) {
      List<dynamic> commentsData = movieDoc['comments'] ?? [];

      List<CommentModel> comments = commentsData.map((comment) {
        return CommentModel.fromMap(comment);
      }).toList();

      print(comments);
      return comments;
    } else {
      return [];
    }
  }

  static Future<void> addReplyToComment(String movieId, String commentId, String replyText) async {
    DocumentSnapshot movieDoc = await _firestore.collection('movies').doc(movieId).get();
    var uuid = const Uuid();
    String replyCommentId = uuid.v4();
    User? currentUser = _auth.currentUser;

    if (movieDoc.exists) {
      List<CommentModel> comments = (movieDoc['comments'] as List)
          .map((commentData) => CommentModel.fromMap(commentData))
          .toList();
      for(CommentModel comment in comments){
        if(comment.id == commentId){
          CommentModel newReply = CommentModel(
            id: replyCommentId,
            authorId: currentUser!.uid,
            text: replyText,
            date: DateTime.now(),
            answers: [],
          );

          List<CommentModel> existingReplies = comment.answers ?? [];
          existingReplies.add(newReply);

          await _firestore.collection('movies').doc(movieId).update({
            'comments': comments.map((c) {
              if (c.id == commentId) {
                return {
                  ...c.toMap(),
                  'answers': existingReplies.map((reply) => reply.toMap()).toList(),
                };
              }
              return c.toMap();
            }).toList(),
          });
          return;

        }
      }



    } else {
      throw Exception('Movie not found');
    }
  }
}
