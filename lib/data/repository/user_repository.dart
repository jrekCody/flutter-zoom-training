abstract class UserRepository {
  Future<void> saveUser({
    required String uid,
    required String email,
    required String name,
    required String photo,
  });

  Future<void> saveUserMeetingHistory({
    required String roomName,
    required String id,
  });
}
