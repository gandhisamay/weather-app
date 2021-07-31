import 'package:flutter/material.dart';
import '../widgets/favourites_card.dart';

class SearchLocationScreen extends StatelessWidget {
  final inputLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Clima'),
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: Column(
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
                    controller: inputLocationController,
                    onSubmitted: (_) {},
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
          GridView(
            addRepaintBoundaries: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Column(
                  children: [
                    Row(
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
                    Row(
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
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
