import 'package:flutter/material.dart';

class SearchLocationScreen extends StatelessWidget {
  // const SearchLocationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.blue,
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //A delegate that controls the layout of the children within the [GridView].
            crossAxisCount: 2,
            childAspectRatio: 3 /
                2, //The ratio of the cross-axis to the main-axis extent of each child.),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          children: [
            GridTile(
              header: Row(
                children: [
                  Text(
                    '22',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.white,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Austin',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'USA',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              footer: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    '17%',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    '7km/h',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
