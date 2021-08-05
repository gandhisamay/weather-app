import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Detail with ChangeNotifier {
  int _temperature;
  int _windSpeed;
  double _airPressure;
  double _latitude;
  double _longitude;
  int _woeid;
  String _location;
  int _humidity;
  List<double> _minTemps = [];
  List<double> _maxTemps = [];
  var inputLocationController = TextEditingController();
  dynamic weatherCardData = [];

  String get location {
    return _location;
  }

  String get temperature {
    return _temperature.toString();
  }

  String get windSpeed {
    return _windSpeed.toString();
  }

  String get airPressure {
    return _airPressure.toString();
  }

  String get humidity {
    return _humidity.toString();
  }

  int get dayNumber {
    var dayNum = DateTime.now().weekday;
    return dayNum;
  }

  List<double> get minTemps5days {
    return [..._minTemps];
  }

  List<double> get maxTemps5days {
    return [..._maxTemps];
  }


  Future<void> getLocationByQuery(query) async {
    print('New function.......');
    final date = DateTime.now().toString();
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String day = date.substring(8, 10);
    final urlQuery = Uri.parse(
        "https://www.metaweather.com/api/location/search/?query=$query");
    final responseQuery = await http.get(urlQuery);
    final resQuery = json.decode(responseQuery.body);

    // final urlLattLong = Uri.parse(
    //     'https://www.metaweather.com/api/location/search/?lattlong=${resQuery[0]["latt_long"]}');
    // //https://www.metaweather.com/api/location/search/?lattlong=19.2322482,72.8434354
    // final responseLattLong = await http.get(urlLattLong);
    // final resLattLong = json.decode(responseLattLong.body);

    _location=resQuery[0]['title'];

    _woeid = resQuery[0]["woeid"];
    print(_woeid);

    final urlDaily = Uri.parse(
        "https://www.metaweather.com/api/location/$_woeid/$year/$month/$day");
    final responseDaily = await http.get(urlDaily);
    final resDaily = json.decode(responseDaily.body);
    print(resDaily);
    
    //we need to override the values to get the data of the query city
    var todayData = resDaily[0];
    _humidity= todayData['humidity'];

    var wSpeed=todayData['wind_speed'];
    _windSpeed =wSpeed.round();

    _airPressure= todayData['air_pressure'];
   

    var tempData= todayData['the_temp'];
    _temperature=tempData.round();

     print('$_location---$_humidity---$_windSpeed----$_airPressure----$_temperature');
    //..

     for (int i = 0; i <= 4; i++) {
      _minTemps.add(resDaily[i]['min_temp']);
      _maxTemps.add(resDaily[i]['max_temp']);

    }
    print(_minTemps);

    for (int i = 0; i < 3; i++) {
      if (int.parse(resDaily[i]["created"].substring(11, 13)) > 12) {
        weatherCardData.add([
          resDaily[i]["weather_state_name"],
          '${resDaily[i]["the_temp"]} °C',
          '${(int.parse(resDaily[i]["created"].substring(11, 13)) - 12)} PM'
        ]);
      } else if (int.parse(resDaily[i]["created"].substring(11, 13)) == 12) {
        weatherCardData.add([
          resDaily[i]["weather_state_name"],
          '${resDaily[i]["the_temp"]} °C',
          '${(int.parse(resDaily[i]["created"].substring(11, 13)))} PM'
        ]);
      } else {
        weatherCardData.add([
          resDaily[i]["weather_state_name"],
          '${resDaily[i]["the_temp"]} °C',
          '${(int.parse(resDaily[i]["created"].substring(11, 13)))} AM'
        ]);
      }
    }

    notifyListeners();
  }
}