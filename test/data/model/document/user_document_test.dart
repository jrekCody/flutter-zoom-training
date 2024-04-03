import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';
import 'package:flutter_zoom/data/model/document/user_document.dart';

void main() {
  const testUid = 'test-uid';
  const testEmail = 'test-email';
  const testName = 'test-name';
  const testPhoto = 'test-photo';
  
  group('UserDocument', () {
    test('fromMap constructs correct instance', () {
      final map = {
        FirebaseFields.uid: testUid,
        FirebaseFields.email: testEmail,
        FirebaseFields.displayName: testName,
        FirebaseFields.photoUrl: testPhoto,
      };

      final document = UserDocument.fromMap(map);

      expect(document.id, testUid);
      expect(document.email, testEmail);
      expect(document.name, testName);
      expect(document.photo, testPhoto);
    });

    test('toMap returns correct map', () {
      const document = UserDocument(
        id: testUid,
        email: testEmail,
        name: testName,
        photo: testPhoto,
      );

      final map = document.toMap();

      expect(map[FirebaseFields.uid], testUid);
      expect(map[FirebaseFields.email], testEmail);
      expect(map[FirebaseFields.displayName], testName);
      expect(map[FirebaseFields.photoUrl], testPhoto);
    });

    test('copyWith returns correct copy', () {
      const document = UserDocument(
        id: testUid,
        email: testEmail,
        name: testName,
        photo: testPhoto,
      );

      final copy = document.copyWith(
        id: 'new-uid',
        email: 'new-email',
        name: 'new-display-name',
        photo: 'new-photo-url',
      );

      expect(copy.id, 'new-uid');
      expect(copy.email, 'new-email');
      expect(copy.name, 'new-display-name');
      expect(copy.photo, 'new-photo-url');
    });
  });
}
