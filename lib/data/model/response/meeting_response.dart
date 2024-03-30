import 'package:equatable/equatable.dart';
import 'package:flutter_zoom/data/model/document/meeting_document.dart';

class MeetingResponse extends Equatable {
  const MeetingResponse({
    required this.roomName,
    required this.createdAt,
  });

  final String roomName;
  final DateTime? createdAt;

  factory MeetingResponse.fromDocument(
    MeetingDocument document,
  ) {
    return MeetingResponse(
      roomName: document.roomName,
      createdAt: document.createdAt?.toDate(),
    );
  }

  @override
  List<Object?> get props => [
        roomName,
        createdAt,
      ];
}
