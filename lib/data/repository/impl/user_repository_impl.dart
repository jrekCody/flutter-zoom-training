import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_zoom/data/constant/firebase_collections.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';
import 'package:flutter_zoom/data/model/document/meeting_document.dart';
import 'package:flutter_zoom/data/model/response/meeting_response.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserRepository)
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

  @override
  Future<void> saveUserMeetingHistory({
    required String roomName,
    required String id,
  }) async {
    await firebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(id)
        .collection(FirebaseCollections.meetingCollection)
        .add({
      FirebaseFields.roomName: roomName,
      FirebaseFields.createdAt: Timestamp.now(),
    });
  }

  @override
  Stream<List<MeetingResponse>> getUserMeetingHistory({
    required String userId,
  }) {
    final meetings = firebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(userId)
        .collection(FirebaseCollections.meetingCollection)
        .orderBy(FirebaseFields.createdAt, descending: true)
        .withConverter(
            fromFirestore: MeetingDocument.fromFirestore,
            toFirestore: (meeting, _) => meeting.toMap())
        .snapshots();

    return meetings.asyncMap((event) {
      final docs = event.docs;
      return docs
          .map((item) => MeetingResponse.fromDocument(item.data()))
          .toList();
    });
  }
}
