import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';

class WeatherCard extends StatelessWidget {
  // const WeatherCard({ Key? key }) : super(key: key);
  final String temp;
  final String time;
  final String weather;

  WeatherCard({
    @required this.temp,
    @required this.time,
    @required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xFF17242D),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF17242D),
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        height: deviceHeight * 0.8,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: Text(
                time,
                style: kCountryStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              height: deviceHeight * 0.12 / 2.5,
              color: Color(0xFF17242D),
              child: SizedBox(
                height: 50,
                width: 50,
                child: weatherVsSVG[weather],
              ),
            ),
            Text(
              temp,
              style: kCityStyle,
            )
          ],
        ),
      ),
    );
  }
}
