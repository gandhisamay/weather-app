import 'package:flutter/material.dart';

class FavouriteCity {
  int temp;
  String city;
  int humidity;
  int windSpeed;

  FavouriteCity({
    @required this.temp,
    @required this.city,
    @required this.humidity,
    @required this.windSpeed,
  });
}

class FavouriteCityProvider with ChangeNotifier {
  List<FavouriteCity> _favourites = [];

  List<FavouriteCity> get favourites {
    return [..._favourites];
  }

  bool get isEmpty {
    return _favourites.isEmpty;
  }

  void addNewFavourite(
    int temp,
    String city,
    int humidity,
    int windSpeed,
  ) {
    if (_favourites.contains(FavouriteCity(
        temp: temp,
        city: city,
        humidity: humidity,
        windSpeed: windSpeed))) {
      return;
    } else {
      _favourites.add(
        FavouriteCity(
          temp: temp,
          city: city,
          humidity: humidity,
          windSpeed: windSpeed,
        ),
      );
    }
    notifyListeners();
  }
}
