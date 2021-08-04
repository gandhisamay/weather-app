import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';
import 'package:flutter_complete_guide/providers/favourites_city_provider.dart';

class FavouritesCard extends StatelessWidget {
  final FavouriteCity favourite;

  FavouritesCard(this.favourite);
  final Color color = Colors.white10;
  @override
  Widget build(BuildContext context) {
    return GridTile(
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
                  favourite.temp.toString(),
                  style: kTempStyle,
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                favourite.city,
                style: kCityStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                favourite.country,
                style: kCountryStyle,
              ),
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
                        '${favourite.humidity}%',
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
                      SizedBox(width: 3,),
                      Text(
                        '${favourite.windSpeed} km/h',
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
    );
  }
}
