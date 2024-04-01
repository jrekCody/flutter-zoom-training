import 'package:equatable/equatable.dart';

final class MeetingRequest extends Equatable {
  const MeetingRequest({
    this.uid,
    this.roomName,
    this.createdAt,
  });

  final String? uid;
  final String? roomName;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [
        uid,
        roomName,
        createdAt,
      ];

  MeetingRequest copyWith({
    String? uid,
    String? roomName,
    DateTime? createdAt,
  }) {
    return MeetingRequest(
      uid: uid ?? this.uid,
      roomName: roomName ?? this.roomName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
