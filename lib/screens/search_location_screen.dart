import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/favourites_city_provider.dart';
import 'package:flutter_complete_guide/providers/location.dart';
import 'package:flutter_complete_guide/screens/weather_detail.dart';
import 'package:flutter_complete_guide/widgets/favourites_card.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import '../providers/detail_screen_provider.dart';

class SearchLocationScreen extends StatelessWidget {
  final inputLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final favouritesCities = Provider.of<FavouriteCityProvider>(context);
    final detailProvider = Provider.of<Detail>(context);


    final searchLocationController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 53,
                left: 10,
                right: 10,
              ),
              height: 50,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchLocationController,
                      onSubmitted: (_) async {
                        print(searchLocationController.text);

                        favouritesCities.addNewFavourite(
                            int.parse(detailProvider.temperature),
                            detailProvider.location,
                            int.parse(detailProvider.humidity),
                            int.parse(detailProvider.windSpeed));

                        await detailProvider.getLocationByQuery(searchLocationController.text);

                        //write code to chnage the tab to detail screen passing the searchLocationController.text to that page


                        
                      },
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 20,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.create_rounded,
                    size: 30,
                    color: Colors.white54,
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: (MediaQuery.of(context).size.height - ktabSize - 103),
                child: favouritesCities.isEmpty
                    ? Center(
                        child: Text(
                          "You haven't added any favourite cities",
                          style: kCountryStyle,
                        ),
                      )
                    : GridView(
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //A delegate that controls the layout of the children within the [GridView].
                          crossAxisCount: 2,
                          childAspectRatio:
                              1.25, //The ratio of the cross-axis to the main-axis extent of each child.),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        children: favouritesCities.favourites
                            .map(
                              (e) => FavouritesCard(e),
                            )
                            .toList(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
