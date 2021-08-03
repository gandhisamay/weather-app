import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';

class WeatherCard extends StatelessWidget {
  // const WeatherCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 6,
      color: Color(0xFF17242D),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Color(0xFF17242D),
          width: 2,         
        ),
        borderRadius: BorderRadius.all(Radius.circular(12))),
        height: deviceHeight * 0.12,
        child: Column(
          children: [
            Text(
              '10 AM',
              style: kCountryStyle,
            ),
            Container(
              child: Text('icon here ',style: TextStyle(color:Colors.blueGrey ),),
              height: deviceHeight * 0.12 / 2.5,
              color: Color(0xFF17242D),
            ),
            Text(
              '19°',
              style: kCityStyle,
            )
          ],
        ),
      ),
    );
  }
}
