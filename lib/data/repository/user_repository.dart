import 'package:flutter_zoom/data/model/request/meeting_request.dart';
import 'package:flutter_zoom/data/model/request/user_request.dart';
import 'package:flutter_zoom/data/model/response/meeting_response.dart';

abstract class UserRepository {
  Future<void> saveUser({
    required UserRequest request,
  });

  Future<void> saveUserMeetingHistory({
    required MeetingRequest request,
  });

  Stream<List<MeetingResponse>> getUserMeetingHistory({
    required String userId,
  });
}
