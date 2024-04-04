import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/constant/firebase_collections.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';
import 'package:flutter_zoom/data/model/document/meeting_document.dart';
import 'package:flutter_zoom/data/model/document/user_document.dart';
import 'package:flutter_zoom/data/model/request/meeting_request.dart';
import 'package:flutter_zoom/data/model/request/user_request.dart';
import 'package:flutter_zoom/data/model/response/meeting_response.dart';
import 'package:flutter_zoom/data/repository/impl/user_repository_impl.dart';

void main() {
  late UserRepositoryImpl userRepositoryImpl;

  late FakeFirebaseFirestore fakeFirebaseFirestore;

  // create fake user request
  const userRequest = UserRequest(
    id: 'test-uid',
    email: 'test-email',
    name: 'test-name',
    photo: 'test-photo',
  );

  // create fake meeting request
  const meetingRequest = MeetingRequest(
    uid: 'test-uid',
    roomName: 'test-room-name',
  );

  // create new meeting document
  final meetingDocument = MeetingDocument.defaultValue.copyWith(
    uid: meetingRequest.uid,
    roomName: meetingRequest.roomName,
    createdAt: Timestamp.now(),
  );

  setUp(() {
    // create fake firebase firestore instance
    fakeFirebaseFirestore = FakeFirebaseFirestore();

    // instantiate userRepositoryImpl
    userRepositoryImpl = UserRepositoryImpl(fakeFirebaseFirestore);
  });

  test('user should be save in users collection', () async {
    // create new user document
    final user = UserDocument.defaultValue.copyWith(
      id: userRequest.id,
      email: userRequest.email,
      name: userRequest.name,
      photo: userRequest.photo,
    );

    // save user document in firestore
    fakeFirebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(user.id)
        .set(
          user.toMap(),
          SetOptions(merge: true),
        );

    // call userRepositoryImpl.saveUser method
    await userRepositoryImpl.saveUser(request: userRequest);

    // fetch user document from firestore
    final userResponse = await fakeFirebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(user.id)
        .withConverter(
            fromFirestore: UserDocument.fromFirestore,
            toFirestore: (user, _) => user.toMap())
        .get();

    // assert that saveUser method is void function
    expect(
      () => userRepositoryImpl.saveUser(request: userRequest),
      isA<void>(),
    );

    // assert that user document is equal to user request
    expect(userRequest.id, userResponse.data()?.id);
    expect(userRequest.name, userResponse.data()?.name);
  });

  test('meeting should be save in meetings collection', () async {
    // save meeting document in firestore
    fakeFirebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(meetingRequest.uid)
        .collection(FirebaseCollections.meetingCollection)
        .add(meetingDocument.toMap());

    // call userRepositoryImpl.saveUserMeetingHistory method
    await userRepositoryImpl.saveUserMeetingHistory(request: meetingRequest);

    // assert that saveUserMeetingHistory method is void function
    expect(
      () => userRepositoryImpl.saveUserMeetingHistory(request: meetingRequest),
      isA<void>(),
    );
  });

  test('should retrieve user meetings in realtime', () async {
    // save/insert meeting document in firestore
    fakeFirebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(meetingRequest.uid)
        .collection(FirebaseCollections.meetingCollection)
        .add(meetingDocument.toMap());

    // fetch meeting document from firestore
    final stream = fakeFirebaseFirestore
        .collection(FirebaseCollections.userCollection)
        .doc(meetingDocument.uid)
        .collection(FirebaseCollections.meetingCollection)
        .orderBy(FirebaseFields.createdAt, descending: true)
        .withConverter(
            fromFirestore: MeetingDocument.fromFirestore,
            toFirestore: (meeting, _) => meeting.toMap())
        .snapshots();

    // convert meeting document to meeting response
    final meetings = await stream.asyncMap((event) {
      final docs = event.docs;
      return docs
          .map((item) => MeetingResponse.fromDocument(item.data()))
          .toList();
    }).first;

    // call userRepositoryImpl.getUserMeetingHistory method
    userRepositoryImpl.getUserMeetingHistory(userId: meetingDocument.uid);

    // assert the length is 1
    expect(meetings.length, 1);

    // assert the first meeting document is equal to meeting request
    expect(meetings.first.uid, meetingRequest.uid);
    expect(meetings.first.roomName, meetingRequest.roomName);
  });

  tearDown(() => fakeFirebaseFirestore.clearPersistence());
}
