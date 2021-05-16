import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String email;

  updateEmail(userEmail) {
    email = userEmail;
    notifyListeners();
  }
}
