import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/movieScreen.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = 'PaymentScreen';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onChanged: (String firstName) {
                  print(firstName);
                  Provider.of<UserModel>(context, listen: false)
                      .updateFirstName(firstName);
                },
                validator: (firstName) {
                  if (firstName.isEmpty) {
                    return 'enter first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onChanged: (String lastName) {
                  Provider.of<UserModel>(context, listen: false)
                      .updateLastName(lastName);
                },
                validator: (lastName) {
                  if (lastName.isEmpty) {
                    return 'enter last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Card Number'),
                onChanged: (String cardNumber) {
                  Provider.of<UserModel>(context, listen: false)
                      .updateCardNumber(cardNumber);
                },
                validator: (cardNumber) {
                  if (cardNumber.isEmpty) {
                    return 'enter card number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'expiry date (mm/yyyy)'),
                onChanged: (String cardExpiryDate) {
                  Provider.of<UserModel>(context, listen: false)
                      .updateCardExpiryDate(cardExpiryDate);
                },
                validator: (expiryDate) {
                  if (expiryDate.isEmpty) {
                    return 'enter expiry date';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Security Code'),
                onChanged: (String cardSecurityCode) {
                  Provider.of<UserModel>(context, listen: false)
                      .updateCardSecurityCode(cardSecurityCode);
                },
                validator: (securityCode) {
                  if (securityCode.isEmpty) {
                    return 'enter security code';
                  }
                  return null;
                },
              ),
              Consumer<UserModel>(builder: (context, user, _) {
                return RaisedButton(
                  child: Text('complete'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      try {
                        final newUser = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: user.email, password: user.password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, MovieScreen.id);
                        }
                      } //handling Firebase errors
                      on FirebaseAuthException catch (error) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('error!'),
                                content: Text(
                                  error.message,
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text('sure'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  )
                                ],
                              );
                            });
                      }
                    }
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
