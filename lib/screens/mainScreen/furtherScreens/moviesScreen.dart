import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            height: 150.0,
            width: double.infinity,
            // color: Colors.red,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      splashColor: Colors.white12,
                      child: Text(
                        "view more",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      onPressed: () {
                        print('view more tapped');
                      },
                    ),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return Container();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
