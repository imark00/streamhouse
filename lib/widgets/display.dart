import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String categoryTitle;
  final Widget fetchData;

  const Display({
    Key key,
    @required this.categoryTitle,
    @required this.fetchData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 5.0, bottom: 10.0),
            child: Text(
              categoryTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          fetchData,
        ],
      ),
    );
  }
}
