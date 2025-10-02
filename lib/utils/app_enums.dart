enum VerificationFlow {
  signUp,
  forgotPassword,
}

enum UserRole { user, trainer }

class G {
  static final G _instance = G._internal();
  factory G() => _instance;
  G._internal();

    UserRole user = UserRole.trainer;

  void setUserRole(UserRole newRole) {
    user = newRole;
  }
}
