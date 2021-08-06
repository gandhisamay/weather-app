import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';
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
  final textStyle2 = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  // Widget _buildListTile({String text, Function onPressed}) {
  //   return ListTile(
  //     leading: Text(
  //       text,
  //       style: textStyle1,
  //     ),
  //     trailing: IconButton(
  //       icon: Icon(
  //         Icons.arrow_forward_sharp,
  //         color: Colors.white,
  //       ),
  //       onPressed: () {
  //         print('Button pressed');
  //         onPressed();
  //       },
  //     ),
  //   );
  // }

  Widget _buildWeatherContainer(IconData icon, String text) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.blueGrey,
            size: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: textStyle2,
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final weatherDataProvider = Provider.of<Location>(context);
    final deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              SizedBox(
                height: 150,
                width: 150,
                child: weatherVsSVG[weatherDataProvider.getWeatherStateName],
              ),
              SizedBox(height: 25),
              Chip(
                backgroundColor: Colors.purple,
                label: Text(
                  //text changes depending on time
                  weatherDataProvider.getWeatherStateName,
                  style: textStyle1,
                ),
              ),
              SizedBox(height: 5),
              Text(
                weatherDataProvider.temperature + '°C',
                style: TextStyle(
                    fontSize: deviceHeight * 0.07, color: Colors.white),
              ),
              SizedBox(height: deviceHeight * 0.03),
              Container(
                height: deviceHeight * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildWeatherContainer(Icons.air_rounded,
                        weatherDataProvider.windSpeed + ' km/h'),
                    _buildWeatherContainer(Icons.pin_drop_rounded,
                        weatherDataProvider.humidity + ' %'),
                    _buildWeatherContainer(
                        Icons.alarm, weatherDataProvider.airPressure + ' bar'),
                  ],
                ),
              ),
              SizedBox(height: deviceHeight * 0.05),

              // Container(
              //   height: deviceHeight * 0.25,
              //   child: Column(
              //     children: [
              //       _buildListTile(text: 'Temperature', onPressed: ),
              //       _buildListTile(text: 'Wind Speed', onPressed: null),
              //       _buildListTile(text: 'Source', onPressed: null),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
