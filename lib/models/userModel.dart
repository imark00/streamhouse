import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String email;
  String password;
  String firstName;
  String lastName;
  String cardNumber;
  String cardExpiryDate;
  String cardSecurityCode;
  double subscriptionAmount;

  updateEmail(userEmail) {
    email = userEmail;
    notifyListeners();
  }

  updatePassword(userPassword) {
    password = userPassword;
    notifyListeners();
  }

  updateSubscriptionAmount(userSubscriptionAmount) {
    subscriptionAmount = userSubscriptionAmount;
    notifyListeners();
  }

  updateFirstName(userFirstName) {
    firstName = userFirstName;
    notifyListeners();
  }

  updateLastName(userLastName) {
    lastName = userLastName;
    notifyListeners();
  }

  updateCardNumber(userCardNumber) {
    cardNumber = userCardNumber;
    notifyListeners();
  }

  updateCardExpiryDate(userCardExpiryDate) {
    cardExpiryDate = userCardExpiryDate;
    notifyListeners();
  }

  updateCardSecurityCode(userCardSecurityCode) {
    cardSecurityCode = userCardSecurityCode;
    notifyListeners();
  }
}
