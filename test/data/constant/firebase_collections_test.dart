import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/constant/firebase_collections.dart';

void main() {
  group('FirebaseCollections', () {
    test('userCollection returns correct value', () {
      expect(FirebaseCollections.userCollection, 'users');
    });

    test('meetingCollection returns correct value', () {
      expect(FirebaseCollections.meetingCollection, 'meetings');
    });
  });
}
