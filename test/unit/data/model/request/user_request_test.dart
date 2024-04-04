import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/request/user_request.dart';

void main() {
  const testUid = 'test-uid';
  const testEmail = 'test-email';
  const testName = 'test-name';
  const testPhoto = 'test-photo';

  // create a new instance of the request
  const userRequest = UserRequest(
    id: testUid,
    email: testEmail,
    name: testName,
    photo: testPhoto,
  );

  group('UserRequest', () {
    test('copyWith should return a correct copy', () {
      // create a new copy of the request
      final copy = userRequest.copyWith(
        id: 'new-$testUid',
        email: 'new-$testEmail',
        name: 'new-$testName',
        photo: 'new-$testPhoto',
      );

      expect(copy.id, 'new-test-uid');
      expect(copy.email, 'new-$testEmail');
      expect(copy.name, 'new-$testName');
      expect(copy.photo, 'new-test-photo');
      expect(copy.email, isNot('test-photo'));
    });

    test('copyWith should return original value when no new value provided',
        () {
      // no new value provided
      final copy = userRequest.copyWith();

      expect(copy.id, testUid);
      expect(copy.name, testName);
      expect(copy.email, testEmail);
      expect(copy.photo, testPhoto);
    });

    test('props should return correct properties', () {
      final props = userRequest.props;

      expect(props, [
        testUid,
        testEmail,
        testName,
        testPhoto,
      ]);
    });
  });
}
