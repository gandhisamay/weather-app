import 'package:flutter/material.dart';
import '../constants.dart';



class BuildListTile extends StatelessWidget {
  const BuildListTile({
    Key key,
    @required this.text,
    @required this.maxTemp,
    @required this.minTemp,
  }) : super(key: key);

  final String text;
  final String maxTemp;
  final String minTemp;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Color(0xFF17242D),
      child: Container(
        height: 50,
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Spacer(),
            Container(
              child: Row(
                children: [
                  Text(
                    maxTemp,
                    style: kCityStyle,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    minTemp,
                    style: kCountryStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}