import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';

class FavouritesCard extends StatelessWidget {
  final Color color = Colors.white10;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  "22",
                  style: kTempStyle,
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                "Austria",
                style: kCityStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                "USA",
                style: kCountryStyle,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                    top: 15,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                      Text(
                        '22',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(
                    right: 25,
                    top: 15,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                      Text(
                        '22',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
