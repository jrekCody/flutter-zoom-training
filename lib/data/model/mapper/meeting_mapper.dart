import 'package:flutter_zoom/data/model/meeting_model.dart';
import 'package:flutter_zoom/data/model/response/meeting_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
final class MeetingMapper with MeetingMixin {
  MeetingModel responseToDomain(MeetingResponse response) {
    return mapMeeting(response);
  }

  List<MeetingModel> responseToDomainList(List<MeetingResponse> responseList) {
    return responseList.map(responseToDomain).toList();
  }
}

mixin MeetingMixin {
  MeetingModel mapMeeting(MeetingResponse response) {
    return MeetingModel(
      roomName: response.roomName,
      createdAt: response.createdAt,
    );
  }
}
