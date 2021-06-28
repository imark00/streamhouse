import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/getStartedScreen/getStartedScreen.dart';
import 'package:stream_house/screens/mainScreen/mainScreen.dart';
import 'package:stream_house/screens/detailsScreen/detailsScreen.dart';
import 'package:stream_house/screens/signInScreen/signInScreen.dart';
import 'package:stream_house/screens/signUpScreen/signUpScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(StartApp()));
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
          SignUpScreen.id: (context) => SignUpScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          MainScreen.id: (context) => MainScreen(),
          DetailsScreen.id: (context) => DetailsScreen()
        },
      ),
    );
  }
}
