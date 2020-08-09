class User {
  String _email;
  String _password;

  void getEmail(String email) {
    _email = email;
  }

  String setEmail() => _email;

  void getPassword(String password) {
    _password = password;
  }

  String setPassword() => _password;
}
