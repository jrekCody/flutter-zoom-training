import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';

void main() {
  group('FirebaseFields', () {
    test('field uid returns correct value', () {
      expect(FirebaseFields.uid, 'uid');
    });

    test('field email  returns correct value', () {
      expect(FirebaseFields.email, 'email');
    });

    test('field displayName  returns correct value', () {
      expect(FirebaseFields.displayName, 'name');
    });

    test('field photoUrl  returns correct value', () {
      expect(FirebaseFields.photoUrl, 'photo');
    });

    test('field roomName  returns correct value', () {
      expect(FirebaseFields.roomName, 'roomName');
    });
    
    test('field createdAt  returns correct value', () {
      expect(FirebaseFields.createdAt, 'createdAt');
    });
  });
}
