import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveDiaryEntry({
    required String text,
    required String emotion,
    required String translatedText,
    required String languageCode,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore.collection('diary_entries').add({
      'uid': user.uid,
      'text': text,
      'translated_text': translatedText,
      'emotion': emotion,
      'language': languageCode,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getUserEntries() {
    final user = _auth.currentUser;
    return _firestore
        .collection('diary_entries')
        .where('uid', isEqualTo: user?.uid)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
