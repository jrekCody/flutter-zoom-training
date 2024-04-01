import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_zoom/data/constant/firebase_fields.dart';

final class UserDocument extends Equatable {
  const UserDocument({
    required this.id,
    required this.email,
    required this.name,
    required this.photo,
  });

  final String id;
  final String email;
  final String name;
  final String photo;

  factory UserDocument.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return UserDocument.fromMap(snapshot.data()!);
  }

  factory UserDocument.fromMap(Map<String, dynamic> map) {
    return UserDocument(
      id: map[FirebaseFields.uid],
      email: map[FirebaseFields.email],
      name: map[FirebaseFields.displayName],
      photo: map[FirebaseFields.photoUrl],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      FirebaseFields.uid: id,
      FirebaseFields.email: email,
      FirebaseFields.displayName: name,
      FirebaseFields.photoUrl: photo,
    };
  }

  static const defaultValue = UserDocument(
    id: '',
    email: '',
    name: '',
    photo: '',
  );

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        photo,
      ];

  UserDocument copyWith({
    final String? id,
    final String? email,
    final String? name,
    final String? photo,
  }) {
    return UserDocument(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }
}
