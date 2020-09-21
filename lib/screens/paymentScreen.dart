import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/models/userModel.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = 'PaymentScreen';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
              onChanged: (String firstName) {
                Provider.of<User>(context, listen: false)
                    .updateFirstName(firstName);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
              onChanged: (String lastName) {
                Provider.of<User>(context, listen: false)
                    .updateLastName(lastName);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Card Number'),
              onChanged: (String cardNumber) {
                Provider.of<User>(context, listen: false)
                    .updateCardNumber(cardNumber);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Expiry Date'),
              onChanged: (String cardExpiryDate) {
                Provider.of<User>(context, listen: false)
                    .updateCardExpiryDate(cardExpiryDate);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Security Code'),
              onChanged: (String cardSecurityCode) {
                Provider.of<User>(context, listen: false)
                    .updateCardSecurityCode(cardSecurityCode);
              },
            ),
            Consumer<User>(builder: (context, user, _) {
              return RaisedButton(
                child: Text('complete'),
                onPressed: () {},
              );
            })
          ],
        ),
      ),
    );
  }
}

//              onPressed: () async {
//                try {
//                  final newUser = await FirebaseAuth.instance
//                      .createUserWithEmailAndPassword(
//                          email: user.getEmail(), password: user.getPassword());
//                  if (newUser != null) {
//                    Navigator.pushNamed(context, routeName);
//                  }
//                } catch (error) {
//                  print(error);
//                }
//              },
