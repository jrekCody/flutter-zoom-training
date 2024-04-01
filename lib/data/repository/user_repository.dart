import 'package:flutter_zoom/data/model/request/user_request.dart';
import 'package:flutter_zoom/data/model/response/meeting_response.dart';

abstract class UserRepository {
  Future<void> saveUser({
    required UserRequest request,
  });

  Future<void> saveUserMeetingHistory({
    required String roomName,
    required String id,
  });

  Stream<List<MeetingResponse>> getUserMeetingHistory({
    required String userId,
  });
}
