import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/getStartedScreen/getStartedScreen.dart';
import 'package:stream_house/screens/homeScreen.dart';
import 'package:stream_house/screens/movieScreen.dart';
import 'package:stream_house/screens/paymentScreen.dart';
import 'package:stream_house/screens/signInScreen.dart';
import 'package:stream_house/screens/signUpScreen.dart';
import 'package:stream_house/screens/subscriptionPlanScreen.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart' as dp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(dp.DevicePreview(builder: (context) => StartApp())));
  await Firebase.initializeApp();

  //todo: you would also change the screen orientation in the main activity in the android directory
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
        initialRoute: GetStartedScreen.id,

        //pathways for different screens in the application
        routes: {
          GetStartedScreen.id: (context) => GetStartedScreen(),
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
