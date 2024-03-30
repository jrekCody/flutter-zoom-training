import 'package:equatable/equatable.dart';

class MeetingModel extends Equatable {
  const MeetingModel({
    required this.roomName,
    required this.createdAt,
  });

  final String roomName;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [
        roomName,
        createdAt,
      ];

  MeetingModel copyWith({
    String? roomName,
    DateTime? createdAt,
  }) {
    return MeetingModel(
      roomName: roomName ?? this.roomName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
