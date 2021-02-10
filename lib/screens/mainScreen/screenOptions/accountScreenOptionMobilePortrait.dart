import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                Text(
                  'username',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'email',
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
                fontSize: 20.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Account Settings",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.language_rounded,
              color: Colors.white,
            ),
            title: Text(
              "Language",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.help_rounded,
              color: Colors.white,
            ),
            title: Text(
              "Account Settings",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
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
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final Function _onTap;

  Tile(this._icon, this._title, this._onTap);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        _icon,
        color: Colors.white,
      ),
      title: Text(
        _title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
      ),
      onTap: _onTap,
    );
  }
}
