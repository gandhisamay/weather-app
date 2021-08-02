import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../constants.dart';
import 'search_location_screen.dart';
import 'weather_detail.dart';
import 'weather_overview.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({ Key? key }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var changeTabScreen = [
    WeatherDetailScreen(),
    SearchLocationScreen(),
    WeatherOverviewScreen()
  ];

  var _page = 0; //shows current page number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: CurvedNavigationBar(
          color: Color(0xFF17242D),
          height: ktabSize,
          backgroundColor: Color(0xFF17242D),
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.red,
            ),
            Icon(
              Icons.favorite_border_outlined,
              size: 30,
              color: Colors.red,
            ),
            Icon(
              Icons.align_horizontal_right_rounded,
              size: 30,
              color: Colors.red,
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      ),
      body: changeTabScreen[_page],
    );
  }
}
