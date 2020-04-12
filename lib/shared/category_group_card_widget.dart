import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tathastu/shared/category_item.dart';

class CategoryGroupCardWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Category category;

  const CategoryGroupCardWidget({Key key, this.items, this.category})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = ((items.length ~/ 4).toInt()) * 100.0 +
        (((items.length % 4) > 0) ? 1 : 0) * 100.0;
    print('Height : $height');

    return Container(
      // height: height + 52.0,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(14.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Repair',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.title.copyWith(
                    // color: Colors.blueGrey.shade800,
                    ),
              ),
            ),
          ),
          Container(
            // height: height,
            // color: Colors.grey.shade100,
            padding: EdgeInsets.all(0.0),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 4,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              children: items.map((item) {
                return CategoryItemWidget(
                  title: item['title'],
                  iconUrl: item['iconUrl'],
                  category: category,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
