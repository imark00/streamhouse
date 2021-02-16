import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreenOption extends StatefulWidget {
  @override
  _SearchScreenOptionState createState() => _SearchScreenOptionState();
}

class _SearchScreenOptionState extends State<SearchScreenOption> {
  // TextEditingController _controller;
  String _search;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: TextField(
              // controller: _controller,
              style: TextStyle(
                color: Colors.black,
              ),
              cursorHeight: 25.0,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: "Type your search here...",
                prefixStyle: TextStyle(
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  splashRadius: 0.1,
                  onPressed: () {
                    print(_search);
                  },
                ),
              ),
              onChanged: (String s) {
                _search = s;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              "Recent Search",
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
