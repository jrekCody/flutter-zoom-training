import 'package:equatable/equatable.dart';

final class UserRequest extends Equatable {
  const UserRequest({
    this.id,
    this.email,
    this.name,
    this.photo,
  });

  final String? id;
  final String? email;
  final String? name;
  final String? photo;

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        photo,
      ];

  UserRequest copyWith({
    final String? id,
    final String? email,
    final String? name,
    final String? photo,
  }) {
    return UserRequest(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }
}
