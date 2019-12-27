import 'package:flutter/material.dart';
import 'package:tathastu/shared/category_item.dart';

class CategoriesCardWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'iconUrl': 'assets/icons/health.svg',
      'title': 'Health',
    },
    {
      'iconUrl': 'assets/icons/classroom.svg',
      'title':  'Education',
    },
    {
      'iconUrl': 'assets/icons/food.svg', 
      'title': 'Food',
    },
    {
      'iconUrl': 'assets/icons/entertainment.svg', 
      'title': 'Entertainment',
    },
    {
      'iconUrl': 'assets/icons/consultant.svg', 
      'title': 'Consultants',
    },
    {
      'iconUrl': 'assets/icons/office.svg', 
      'title': 'Offices',
    },
    {
      'iconUrl': 'assets/icons/shop.svg', 
      'title': 'Shops',
    },
    {
      'iconUrl': 'assets/icons/more.svg', 
      'title': 'More',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
          child: Container(
            height: 200.0,
          
 
        // decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(8.0),
        //               color: Colors.white,
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.blueGrey[100],
        //                   blurRadius: 2.0,
        //           spreadRadius: 1.0,
        //           offset: Offset(0, 2),
        //                 ),
        //               ],
        //             ),
        // child: Center(
        //   child: Wrap(
        //     spacing: 8.0, // gap between adjacent chips
        //     // runSpacing: 4.0, // gap between lines
        //     children: <Widget>[
        //       categoryItemComponent(context, , ,),
        //       categoryItemComponent(context, ),
        //       categoryItemComponent(context, ,),
        //       categoryItemComponent(context, ),
        //       categoryItemComponent(context, ),
        //       categoryItemComponent(context, ),
        //       categoryItemComponent(context, ),
        //       categoryItemComponent(context, ),
              
        //     ],
        //   ),
        // ),
        child: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,

          children: items.map((item){
            return CategoryItemWidget(title: item['title'] ,iconUrl: item['iconUrl'],);
          }).toList(),
        ),
      ),
    );
  }
}