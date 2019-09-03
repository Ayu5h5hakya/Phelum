abstract class UserRepository{
  Future<bool> isAuthenticated();

  Future<void> authenticate(String email, String password);

  Future<String> getUserId();
}