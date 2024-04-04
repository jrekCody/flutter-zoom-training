import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/data/model/mapper/meeting_mapper.dart';
import 'package:flutter_zoom/data/model/response/meeting_response.dart';
import 'package:flutter_zoom/data/model/meeting_model.dart';

void main() {
  const testUid = 'test-uid';
  const testRoom = 'test-room-name';

  final MeetingMapper meetingMapper = MeetingMapper();

  group('MeetingMapper', () {
    test('should map single MeetingResponse to MeetingModel', () {
      // create a MeetingResponse object
      final MeetingResponse response = MeetingResponse(
        uid: testUid,
        roomName: testRoom,
        createdAt: DateTime.now(),
      );

      // map the MeetingResponse object to a MeetingModel object
      final result = meetingMapper.responseToDomain(response);

      // assertions
      expect(result, isA<MeetingModel>());
      expect(result.roomName, equals(response.roomName));
      expect(result.createdAt, equals(response.createdAt));
    });

    test('should map list of MeetingResponse to list of MeetingModel', () {
      // create a list of MeetingResponse objects
      final List<MeetingResponse> responseList = [
        MeetingResponse(
            uid: '$testUid-1',
            roomName: '$testRoom-1',
            createdAt: DateTime.now()),
        MeetingResponse(
            uid: '$testUid-2',
            roomName: '$testRoom-2',
            createdAt: DateTime.now()),
      ];

      // map the list of MeetingResponse objects to a list of MeetingModel objects
      final result = meetingMapper.responseToDomainList(responseList);

      // assertions
      expect(result, isA<List<MeetingModel>>());
      expect(result, isNotEmpty);
      expect(result.length, 2);
      expect(result.length, equals(responseList.length));
      expect(result[0].roomName, equals(responseList[0].roomName));
      expect(result[1].roomName, '$testRoom-2');
    });

    test('should handle empty list of MeetingResponse', () {
      final List<MeetingResponse> responseList = [];

      final result = meetingMapper.responseToDomainList(responseList);

      expect(result, isA<List<MeetingModel>>());
      expect(result, isEmpty);
    });
  });
}
