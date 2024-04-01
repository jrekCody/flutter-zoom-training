import 'package:equatable/equatable.dart';
import 'package:flutter_zoom/data/model/document/meeting_document.dart';

class MeetingResponse extends Equatable {
  const MeetingResponse({
    required this.uid,
    required this.roomName,
    required this.createdAt,
  });

  final String uid;
  final String roomName;
  final DateTime? createdAt;

  factory MeetingResponse.fromDocument(
    MeetingDocument document,
  ) {
    return MeetingResponse(
      uid: document.uid,
      roomName: document.roomName,
      createdAt: document.createdAt?.toDate(),
    );
  }

  @override
  List<Object?> get props => [
        uid,
        roomName,
        createdAt,
      ];
}
