import 'package:flutter/material.dart';

class FavouritesCard extends StatelessWidget {
  final Color color = Color(0xFF152C39);
  @override
  Widget build(BuildContext context) {
    return GridTile(
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
    );
  }
}

// Row(
//               children: [
//                 Text(
//                   '22',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 50,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Icon(
//                   Icons.add,
//                   size: 50,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//             Text(
//               'Austin',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               'USA',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             Row(children: [
//               Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 25,
//               ),
//               Text(
//                 '17%',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 25,
//               ),
//               Text(
//                 '7km/h',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ])
