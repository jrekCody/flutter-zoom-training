import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';

final class MeetingDocument extends Equatable {
  const MeetingDocument({
    required this.uid,
    required this.roomName,
    this.createdAt,
  });

  final String uid;
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
      uid: map[FirebaseFields.uid],
      roomName: map[FirebaseFields.roomName],
      createdAt: map[FirebaseFields.createdAt],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      FirebaseFields.uid: uid,
      FirebaseFields.roomName: roomName,
      FirebaseFields.createdAt: createdAt,
    };
  }

  static const defaultValue = MeetingDocument(
    uid: '',
    roomName: '',
  );

  @override
  List<Object?> get props => [
        uid,
        roomName,
        createdAt,
      ];

  MeetingDocument copyWith({
    String? uid,
    String? roomName,
    Timestamp? createdAt,
  }) {
    return MeetingDocument(
      uid: uid ?? this.uid,
      roomName: roomName ?? this.roomName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
