abstract class UserRepository {
  Future<void> saveUser({
    required String uid,
    required String email,
    required String name,
    required String photo,
  });
}
