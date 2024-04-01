import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_zoom/data/constant/firebase_collections.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';
import 'package:flutter_zoom/data/model/document/meeting_document.dart';
import 'package:flutter_zoom/data/model/document/user_document.dart';
import 'package:flutter_zoom/data/model/request/meeting_request.dart';
import 'package:flutter_zoom/data/model/request/user_request.dart';
import 'package:flutter_zoom/data/model/response/meeting_response.dart';
import 'package:flutter_zoom/data/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firebaseFirestore;

  const UserRepositoryImpl(this.firebaseFirestore);

  @override
  Future<void> saveUser({
    required UserRequest request,
  }) async {
    final user = UserDocument.defaultValue.copyWith(
      id: request.id,
      email: request.email,
      name: request.name,
      photo: request.photo,
    );

    await firebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(request.id)
        .set(
          user.toMap(),
          SetOptions(merge: true),
        );
  }

  @override
  Future<void> saveUserMeetingHistory({
    required MeetingRequest request,
  }) async {
    final meeting = MeetingDocument.defaultValue.copyWith(
      uid: request.uid,
      roomName: request.roomName,
      createdAt: Timestamp.now(),
    );

    await firebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(request.uid)
        .collection(FirebaseCollections.meetingCollection)
        .add(meeting.toMap());
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
