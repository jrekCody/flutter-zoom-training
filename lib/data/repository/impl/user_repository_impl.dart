import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_zoom/data/constant/firebase_collections.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firebaseFirestore;

  const UserRepositoryImpl(this.firebaseFirestore);

  @override
  Future<void> saveUser({
    required String uid,
    required String email,
    required String name,
    required String photo,
  }) async {
    final userMap = {
      FirebaseFields.uid: uid,
      FirebaseFields.email: email,
      FirebaseFields.displayName: name,
      FirebaseFields.photoUrl: photo,
    };

    await firebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(uid)
        .set(userMap);
  }
}
