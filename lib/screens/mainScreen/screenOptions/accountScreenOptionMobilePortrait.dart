import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/getStartedScreen/getStartedScreen.dart';
import 'package:stream_house/widgets/roundedRaisedButton.dart';
import 'package:stream_house/widgets/tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreenOption extends StatefulWidget {
  @override
  _AccountScreenOptionState createState() => _AccountScreenOptionState();
}

class _AccountScreenOptionState extends State<AccountScreenOption> {
  @override
  Widget build(BuildContext context) {
    String email = Provider.of<UserModel>(context).email;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 10.0,
            ),
            color: Color(0xff0d2e41),
            width: double.infinity,
            height: 180,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/icons/user.png",
                  ),
                  radius: 55.0,
                ),
                // Text(
                //   'username',
                //   style: TextStyle(
                //     fontSize: 23.0,
                //     fontWeight: FontWeight.w700,
                //     color: Colors.white,
                //   ),
                // ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Settings",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18.0,
              ),
            ),
          ),
          SettingsTile(
            icon: Icons.settings,
            title: "Account Settings",
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.language_rounded,
            title: "Language",
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.help_rounded,
            title: "Help",
            onTap: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Terms",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18.0,
              ),
            ),
          ),
          TermsTile(
            title: "Terms and Conditions",
            onTap: () {},
          ),
          TermsTile(
            title: "Privacy & Policies",
            onTap: () {},
          ),
          SizedBox(
            height: 60.0,
          ),
          Align(
            alignment: Alignment.center,
            child: RoundedRaisedButton(
              buttonText: "log out",
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, GetStartedScreen.id, (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
