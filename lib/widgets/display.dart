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
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('view more');
                  },
                  child: Text(
                    'view more',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          fetchData,
        ],
      ),
    );
  }
}
