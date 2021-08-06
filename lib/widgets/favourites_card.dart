import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';
// import 'package:flutter_complete_guide/providers/favourites_city_data.dart';
import 'package:flutter_complete_guide/providers/favourites_city_provider.dart';
// import 'package:provider/provider.dart';

class FavouritesCard extends StatefulWidget {
  final FavouriteCity favourite;

  FavouritesCard(this.favourite);

  @override
  _FavouritesCardState createState() => _FavouritesCardState();
}

class _FavouritesCardState extends State<FavouritesCard> {
  // @override
  // void didChangeDependencies() {
  //   Provider.of<FavCityDataProvider>(context).getLocationByQuery(fav)
  //   super.didChangeDependencies();
  // }
  final Color color = Colors.white10;

  @override
  Widget build(BuildContext context) {
    print("City ${widget.favourite.city}");
    print("humidity ${widget.favourite.humidity}");
    print("weather ${widget.favourite.weather}");
    print("temperature ${widget.favourite.temp}");
    print("windspeed ${widget.favourite.windSpeed}");
    return GridTile(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '${widget.favourite.temp != null ? widget.favourite.temp : 26} °C',
                    style: kTempStyle,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 18,
                    ),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: weatherVsSVG[widget.favourite.weather],
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  '${widget.favourite.city != null ? widget.favourite.city : "Mumbai"}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 15,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.approval_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        Text(
                          '${widget.favourite.humidity != null ? widget.favourite.humidity : 12}%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(
                      right: 10,
                      top: 15,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.air_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${widget.favourite.windSpeed != null ? widget.favourite.windSpeed : 8} km/h',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
