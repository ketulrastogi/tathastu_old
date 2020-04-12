import 'package:flutter/material.dart';
import 'package:tathastu/shared/category_item.dart';

class CategoriesCardWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'iconUrl': 'assets/icons/health_plus.svg',
      'title': 'Health',
    },
    {
      'iconUrl': 'assets/icons/toolbox.svg',
      'title': 'Repair',
    },
    {
      'iconUrl': 'assets/icons/classroom.svg',
      'title': 'Education',
    },
    {
      'iconUrl': 'assets/icons/food.svg',
      'title': 'Food',
    },
    {
      'iconUrl': 'assets/icons/alarm.svg',
      'title': 'Helplines',
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
    // {
    //   'iconUrl': 'assets/icons/more.svg',
    //   'title': 'More',
    // }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250.0,
      // child: GridView.count(
      //   physics: NeverScrollableScrollPhysics(),
      //   shrinkWrap: true,
      //   primary: true,
      //   crossAxisCount: 4,
      // mainAxisSpacing: 0.0,
      // crossAxisSpacing: 0.0,
      //   children: items.map((item) {
      // return CategoryItemWidget(
      //   title: item['title'],
      //   iconUrl: item['iconUrl'],
      // );
      //   }).toList(),
      // ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: items.length + 1,
        shrinkWrap: true,
        primary: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return CategoryItemWidget(
              title: 'More',
              iconUrl: 'assets/icons/more.svg',
              category: Category.CATEGORYTYPE,
            );
          } else {
            return CategoryItemWidget(
              title: items[index]['title'],
              iconUrl: items[index]['iconUrl'],
              category: Category.CATEGORYGROUP,
            );
          }
        },
      ),
    );
  }
}
