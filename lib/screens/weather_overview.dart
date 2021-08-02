import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/loading_spinner.dart';
import 'package:geocoder/geocoder.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../providers/location.dart';

import 'package:provider/provider.dart';

// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

class WeatherOverviewScreen extends StatefulWidget {
  // const WeatherOverviewScreen({ Key? key }) : super(key: key);

  @override
  _WeatherOverviewScreenState createState() => _WeatherOverviewScreenState();
}

class _WeatherOverviewScreenState extends State<WeatherOverviewScreen> {
  final textStyle1 = TextStyle(color: Colors.white, fontSize: 19);
  final textStyle2 = TextStyle(color: Colors.white, fontSize: 16);
  var _isInit= false ;
  var _isLoading =true;

  @override
  void initState() {
    Provider.of<Location>(context, listen: false).combineAllData().then((_){
       _isInit=true;
    });
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
       _isLoading=false;
    });    
    }  
    _isInit= false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    final weatherDataProvider =Provider.of<Location>(context);
    
    return SafeArea(
      child: Scaffold(
        body: _isLoading? LoadingScreenOverview():Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.location_city,
                  color: Colors.blueGrey,
                ),
                const Text(
                  'Your Location Now ',
                  style: TextStyle(color: Colors.grey),
                )
              ]),
            ),
            // Text(locData.location, style: textStyle1),
            Text(weatherDataProvider.location, style: textStyle1),
            
            SizedBox(height: 25),
            CircleAvatar(
              radius: 80,
              child: ClipRRect(),
            ),
            SizedBox(height: 25),
            Chip(
              backgroundColor: Colors.purple,
              label: Text(
                'Moonlight',
                style: textStyle1,
              ),
            ),
            SizedBox(height: 5),
            Text(
              weatherDataProvider.temperature+'°C',
              // 'hvjvuyuy',
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.reorder_rounded,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      weatherDataProvider.windSpeed,
                      
                      style: textStyle2,
                    )
                  ],
                )),
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pin_drop_rounded,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      weatherDataProvider.humidity,
                      style: textStyle2,
                    )
                  ],
                )),
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.blueGrey,
                    ),
                    Text(
                       weatherDataProvider.airPressure,
                      style: textStyle2,
                    )
                  ],
                )),
                
              ],
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Text(
                'Temperature',
                style: textStyle1,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  // getLocation();
                },
              ),
            ),
            ListTile(
              leading: Text(
                'Wind Speed',
                style: textStyle1,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            ListTile(
              leading: Text(
                'Source',
                style: textStyle1,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  print('Button pressed');
                  // Provider.of<Location>(context,listen: false).getWeatherData();
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
