import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_zoom/data/model/document/meeting_document.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';

void main() {
  group('MeetingDocument', () {
    test('fromMap constructs correct instance', () {
      final map = {
        FirebaseFields.uid: 'test-uid',
        FirebaseFields.roomName: 'test-room-name',
        FirebaseFields.createdAt: Timestamp.now(),
      };

      final document = MeetingDocument.fromMap(map);

      expect(document.uid, 'test-uid');
      expect(document.roomName, 'test-room-name');
      expect(document.createdAt, isNotNull);
    });

    test('toMap returns correct map', () {
      final document = MeetingDocument(
        uid: 'test-uid',
        roomName: 'test-room-name',
        createdAt: Timestamp.now(),
      );

      final map = document.toMap();

      expect(map[FirebaseFields.uid], 'test-uid');
      expect(map[FirebaseFields.roomName], 'test-room-name');
      expect(map[FirebaseFields.createdAt], isNotNull);
    });

    test('copyWith returns correct copy', () {
      final document = MeetingDocument(
        uid: 'test-uid',
        roomName: 'test-room-name',
        createdAt: Timestamp.now(),
      );

      final copy = document.copyWith(
        uid: 'new-uid',
        roomName: 'new-room',
      );

      expect(copy.uid, 'new-uid');
      expect(copy.roomName, 'new-room');
      expect(copy.createdAt, document.createdAt);
    });
  });
}