import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/homeScreen.dart';
import 'package:stream_house/screens/movieScreen.dart';
import 'package:stream_house/screens/paymentScreen.dart';
import 'package:stream_house/screens/signInScreen.dart';
import 'package:stream_house/screens/signUpScreen.dart';
import 'package:stream_house/screens/subscriptionPlanScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  final String title = 'StreamHouse';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModel>(
      create: (context) => UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,

        //initial screen when the application starts
        initialRoute: HomeScreen.id,

        //pathways for different screens in the application
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          SubscriptionPlanScreen.id: (context) => SubscriptionPlanScreen(),
          PaymentScreen.id: (context) => PaymentScreen(),
          MovieScreen.id: (context) => MovieScreen()
        },
      ),
    );
  }
}
