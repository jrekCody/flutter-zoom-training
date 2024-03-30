import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';

final class MeetingDocument extends Equatable {
  const MeetingDocument({
    required this.roomName,
    this.createdAt,
  });

  final String roomName;
  final Timestamp? createdAt;

  factory MeetingDocument.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return MeetingDocument.fromMap(snapshot.data()!);
  }

  factory MeetingDocument.fromMap(Map<String, dynamic> map) {
    return MeetingDocument(
      roomName: map[FirebaseFields.roomName],
      createdAt: map[FirebaseFields.createdAt],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      FirebaseFields.roomName: roomName,
      FirebaseFields.createdAt: createdAt,
    };
  }

  @override
  List<Object?> get props => [
        roomName,
        createdAt,
      ];

  MeetingDocument copyWith(
    String? roomName,
    Timestamp? createdAt,
  ) {
    return MeetingDocument(
      roomName: roomName ?? this.roomName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
