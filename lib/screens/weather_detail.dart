//1st screen in the ui image
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/location.dart';
import 'package:flutter_complete_guide/widgets/loading_spinner.dart';
import '../constants.dart';
import '../widgets/row_card_scroll.dart';
import 'package:provider/provider.dart';
import '../widgets/list_tile.dart';
import '../widgets/weather_container.dart';
import '../providers/detail_screen_provider.dart';

class WeatherDetailScreen extends StatefulWidget {

  static const routeName = '/detail-screen';

  // final String searchedCity ;
  // WeatherDetailScreen({this.searchedCity});

  @override
  _WeatherDetailScreenState createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  final Map<String, String> dayData = {
    "1": "Monday",
    "2": "Tuesday",
    "3": "Wednesday",
    "4": "Thursday",
    "5": "Friday",
    "6": "Saturday",
    "7": "Sunday",
  };

  String getDay(int number) {
    if (number >= 1 && number <= 7) {
      return dayData[number.toString()];
    } else {
      return dayData[(number - 7).toString()];
    }
  }

  // void initState() {
  //   if (isFirstTime) {
  //     Provider.of<Location>(context, listen: false).combineAllData().then((_) {
  //       setState(() {
  //         isLoading = false;
  //         isFirstTime = false;
  //       });
  //     });
  //   }

  //   super.initState();
  // }
  

    void initState() {
    if ( isFirstTime) {
      Provider.of<Detail>(context, listen: false).getLocationByQuery('mumbai').then((_) {
        setState(() {
          isLoading = false;
          isFirstTime = false;
        });
      });
    }

    // else{
    //   Provider.of<Location>(context).getWeatherData().then((_){
    //     setState(() {
    //       isLoading = false;
    //       isFirstTime = false;
    //     });
    //   });
    // }

    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // final weatherDataProvider = Provider.of<Location>(context);
    // final minTemps = weatherDataProvider.minTemps5days;
    // final maxTemps = weatherDataProvider.maxTemps5days;
    // final weatherCardData = weatherDataProvider.weatherCardData;

    final detailDataProvider = Provider.of<Detail>(context);
       final minTemps = detailDataProvider.minTemps5days;
    final maxTemps = detailDataProvider.maxTemps5days;

    // final weatherCardData = detailDataProvider.weatherCardData;


    // print("Weather Card Data ${weatherDataProvider.weatherCardData}");

    // print("Weather Card Data ${detailDataProvider._weatherCardData}");

    List<Widget> buildTile(min, max) {
      List<Widget> tiles = [];
      for (int i = 0; i <= 4; i++) {
        tiles.add(
          BuildListTile(
            text: getDay(Provider.of<Location>(context).dayNumber + i),
            maxTemp: min[i].toStringAsFixed(1),
            minTemp: max[i].toStringAsFixed(1),
          ),
        );
      }
      return tiles;
    }

    final deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF17242D),
        body: isLoading
            ? LoadingScreenOverview()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            // height: deviceHeight*0.4,
                            margin: EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Text(detailDataProvider.location,
                                    style: kCityStyle),
                                Text('${detailDataProvider.temperature} °C',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceHeight * 0.1)),
                                Chip(
                                  backgroundColor: Colors.purple,
                                  label: Text(
                                    'Cloudy',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  elevation: 5,
                                ),
                              ],
                            )),
                        Card(
                          elevation: 5,
                          child: Text('Image here '),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.007),
                    Card(
                      color: Color(0xFF17242D),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BuildWeatherContainer(
                                icon: Icons.air_rounded,
                                text: '${detailDataProvider.windSpeed} km/h'),
                            BuildWeatherContainer(
                                icon: Icons.pin_drop_rounded,
                                text: '${detailDataProvider.humidity}%'),
                            BuildWeatherContainer(
                                icon: Icons.alarm,
                                text: '${detailDataProvider.airPressure} bar'),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(height: deviceHeight * 0.06),
                    SizedBox(height: deviceHeight * 0.02),
                    Center(
                      child: Text(
                        'Today',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      height: deviceHeight * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WeatherCard(
                            temp: detailDataProvider.weatherCardData[0][1],
                            time: detailDataProvider.weatherCardData[0][2],
                            weather: detailDataProvider.weatherCardData[0][0],
                          ),
                          WeatherCard(
                            temp: detailDataProvider.weatherCardData[1][1],
                            time: detailDataProvider.weatherCardData[1][2],
                            weather: detailDataProvider.weatherCardData[1][0],
                          ),
                          WeatherCard(
                            temp: detailDataProvider.weatherCardData[2][1],
                            time: detailDataProvider.weatherCardData[2][2],
                            weather: detailDataProvider.weatherCardData[2][0],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: deviceHeight * 0.3,
                      child: ListView(
                        children: buildTile(minTemps, maxTemps),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
