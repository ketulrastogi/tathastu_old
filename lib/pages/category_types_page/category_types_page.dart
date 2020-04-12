import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tathastu/shared/categories_card.dart';
import 'package:tathastu/shared/category_item.dart';

class CategoryTypesPage extends StatefulWidget {
  @override
  _CategoryTypesPageState createState() => _CategoryTypesPageState();
}

class _CategoryTypesPageState extends State<CategoryTypesPage> {

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
      'iconUrl': 'assets/icons/ngo.svg', 
      'title': 'NGO',
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
      'iconUrl': 'assets/icons/ngo.svg', 
      'title': 'NGO',
    },
    {
      'iconUrl': 'assets/icons/ngo.svg', 
      'title': 'NGO',
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
      'iconUrl': 'assets/icons/ngo.svg', 
      'title': 'NGO',
    },
    {
      'iconUrl': 'assets/icons/more.svg', 
      'title': 'More',
    }
  ];

  @override
  Widget build(BuildContext context) {

    var height = ((items.length ~/ 4).toInt()) * 100.0 + (((items.length % 4) > 0) ? 1 : 0) * 100.0;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Categories',
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold),
            ),
          ),
          
          titleSpacing: 4.0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
                      child: Container(
              padding: EdgeInsets.all(18.0),
              child: SvgPicture.asset('assets/icons/arrow_back.svg',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor,),
          backgroundColor: Colors.white,
          elevation: 1.0,
        ),
        backgroundColor: Colors.blueGrey.shade50,
        body: Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
          child: Container(
            height: height,
        padding: EdgeInsets.only(top: 4.0),
        child: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,

          children: items.map((item){
            return CategoryItemWidget(title: item['title'] ,iconUrl: item['iconUrl'],);
          }).toList(),
        ),
      ),
    ),
      ),
    );
  }
}