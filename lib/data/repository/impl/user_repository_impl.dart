import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firebaseFirestore;

  const UserRepositoryImpl(this.firebaseFirestore);

  @override
  Future<void> saveUser(String uid, String userName, String photo) async {
    final userMap = {
      'uid': uid,
      'username': userName,
      'photo': photo,
    };

    await firebaseFirestore.collection('users').doc(uid).set(userMap);
  }
}
