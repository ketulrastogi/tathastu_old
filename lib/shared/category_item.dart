import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tathastu/pages/category_groups_page/category_groups_page.dart';
import 'package:tathastu/pages/category_types_page/category_types_page.dart';
import 'package:tathastu/pages/contact_list_page/contact_list_page.dart';

enum Category {
  CATEGORYTYPE,
  CATEGORYGROUP,
  CATEGORY,
}

class CategoryItemWidget extends StatelessWidget {
  final String iconUrl, title;
  final Category category;

  const CategoryItemWidget({Key key, this.iconUrl, this.title, this.category})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (category == Category.CATEGORY) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactListPage(),
            ),
          );
        } else if (category == Category.CATEGORYGROUP) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryGroupsPage(
                      categoryName: 'Repair & Services',
                    )),
          );
        } else if (category == Category.CATEGORYTYPE) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryTypesPage()),
          );
        }
      },
      child: new Container(
        // margin: EdgeInsets.all(4.0),

        // height: MediaQuery.of(context).size.width / 4.5,
        // width: MediaQuery.of(context).size.width / 4.5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade100, width: 0.5),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              width: 40,
              height: 40,
              // padding: EdgeInsets.all(4.0),
              child: new SvgPicture.asset(
                iconUrl,
              ),
            ),
            new Container(
              // padding: EdgeInsets.all(4.0),

              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.subtitle.copyWith(
                        fontWeight: FontWeight.bold,
                        // color: Colors.blueGrey.shade800,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
