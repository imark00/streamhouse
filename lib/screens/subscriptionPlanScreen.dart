import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/models/subscriptionPlanModel.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/paymentScreen.dart';

class SubscriptionPlanScreen extends StatelessWidget {
  static const String id = 'SubscriptionPlanScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(plans[index].title),
                  Text('₵${plans[index].amount.toString()}'),
                  Row(
                    children: [
                      Icon(Icons.phone_android),
                      Icon(Icons.tablet_mac),
                      Icon(Icons.laptop_mac),
                      Icon(Icons.desktop_mac)
                    ],
                  ),
                  Text(
                    plans[index].planDescription,
                  ),
                  RaisedButton(
                    child: Text('SELECT'),
                    onPressed: () {
                      Provider.of<User>(context, listen: false)
                          .updateSubscriptionAmount(plans[index].amount);
                      Navigator.pushNamed(context, PaymentScreen.id);
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              ),
            );
          }),
    ));
  }
}
