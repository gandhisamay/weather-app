import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavCityDataProvider with ChangeNotifier {
  int _favTemperature;
  int _favWindSpeed;
  double _favAirPressure;
  int _favWoeid;
  String _favLocation;
  int _favHumidity;
  var inputLocationController = TextEditingController();
  String _weatherStateName;

  String get location {
    return _favLocation;
  }

  String get temperature {
    return _favTemperature.toString();
  }

  String get windSpeed {
    return _favWindSpeed.toString();
  }

  String get airPressure {
    return _favAirPressure.toString();
  }

  String get humidity {
    return _favHumidity.toString();
  }

  int get dayNumber {
    var dayNum = DateTime.now().weekday;
    return dayNum;
  }

  String get getWeatherStateName {
    return _weatherStateName;
  }

  // List<List<String>> get favWeatherCardDataMain {
  //   return [...favWeatherCardData];
  // }

  Future<void> getLocationByQuery(query) async {
    final urlQuery = Uri.parse(
        "https://www.metaweather.com/api/location/search/?query=$query");
    final responseQuery = await http.get(urlQuery);
    final resQuery = json.decode(responseQuery.body);
    print("res query $resQuery");
    final urlLattLong = Uri.parse(
        'https://www.metaweather.com/api/location/search/?lattlong=${resQuery[0]["latt_long"]}');
    //https://www.metaweather.com/api/location/search/?lattlong=19.2322482,72.8434354
    final responseLattLong = await http.get(urlLattLong);
    final resLattLong = json.decode(responseLattLong.body);
    print("res query $resLattLong");

    _favWoeid = resLattLong[0]["woeid"];

    final url =
        Uri.parse('https://www.metaweather.com/api/location/$_favWoeid/');
    final response = await http.get(url);
    // {consolidated_weather:
    //[{id: 5295501353156608, weather_state_name: Heavy Rain, weather_state_abbr: hr,
    // wind_direction_compass: WSW, created: 2021-08-02T10:03:01.963265Z, applicable_date:
    // 2021-08-02, min_temp: 26.865, max_temp: 29.915, the_temp: 28.685,
    //wind_speed: 12.47597132310772, wind_direction: 243.1658529488439,
    // air_pressure: 1007.0, humidity: 80, visibility: 9.216488208860255, predictability: 77},
    // {id: 5311543827759104, weather_state_name: Heavy Rain, weather_state_abbr: hr,
    // wind_direction_compass: WSW, created: 2021-08-02T10:03:04.957071Z, applicable_date: 2021-08-03, min_temp: 26.810000000000002, max_temp: 29.255, the_temp: 28.369999999999997, wind_speed: 12.241166946059016, wind_direction: 244.169629973454, air_pressure: 1008.0, humidity: 82, visibility: 8.50004722421061, predictability: 77}, {id: 6113358588674048, weather_state_name: Heavy Rain, weather_state_abbr: hr, wind_direction_compass: WSW, created: 2021-08-02T10:03:07.966176Z, applicable_date: 2021-08-04, min_temp: 26.83, max_temp: 29.355,
    var consolidatedWeather =
        json.decode(response.body)['consolidated_weather'];
    var wData = consolidatedWeather[0];

    _weatherStateName = wData["weather_state_name"];

    double temp = wData['the_temp'];
    _favTemperature = temp.round();

    double wSpeed = wData['wind_speed'];
    _favWindSpeed = wSpeed.round();

    _favAirPressure = wData['air_pressure'];

    _favHumidity = wData['humidity'];

    notifyListeners();
  }
}
