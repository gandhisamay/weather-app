import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/favourites_city_provider.dart';
import 'package:flutter_complete_guide/providers/location.dart';
import 'package:flutter_complete_guide/widgets/favourites_card.dart';
import '../constants.dart';
import 'package:provider/provider.dart';

class SearchLocationScreen extends StatelessWidget {
  final inputLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final favouritesCities = Provider.of<FavouriteCityProvider>(context);
    final locationProvider = Provider.of<Location>(context);
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
                      controller: locationProvider.inputLocationController,
                      onSubmitted: (_) {
                        // print("1");
                        // print(locationProvider.inputLocationController.text);
                        // locationProvider.getLocationByQuery(
                        //     locationProvider.inputLocationController.text);
                        // favouritesCities.addNewFavourite();
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
