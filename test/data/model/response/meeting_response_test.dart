import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/document/meeting_document.dart';
import 'package:flutter_zoom/data/model/response/meeting_response.dart';

void main() {
  final testCreatedAt = Timestamp.now();

  // create a new instance of MeetingDocument
  final document = MeetingDocument(
    uid: 'test-uid',
    roomName: 'test-room-name',
    createdAt: testCreatedAt,
  );

  group('MeetingResponse', () {
    test('description', () {
      final response = MeetingResponse.fromDocument(document);

      expect(response.uid, 'test-uid');
      expect(response.roomName, 'test-room-name');
    });
    test('props should returns correct properties', () {
      final props = MeetingResponse.fromDocument(document).props;

      expect(props, [
        'test-uid',
        'test-room-name',
        testCreatedAt.toDate(),
      ]);
    });
  });
}
