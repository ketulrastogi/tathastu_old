import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tathastu/shared/categories_card.dart';
import 'package:tathastu/shared/category_group_card_widget.dart';
import 'package:tathastu/shared/category_item.dart';

class CategoryGroupsPage extends StatefulWidget {
  final String categoryName;

  const CategoryGroupsPage({Key key, this.categoryName}) : super(key: key);
  @override
  _CategoryGroupsPageState createState() => _CategoryGroupsPageState();
}

class _CategoryGroupsPageState extends State<CategoryGroupsPage> {
  final List<Map<String, dynamic>> items = [
    {
      'iconUrl': 'assets/icons/health.svg',
      'title': 'Health',
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
      'iconUrl': 'assets/icons/more.svg',
      'title': 'More',
    }
  ];

  final _nativeAdmob = NativeAdmob();

  @override
  void initState() {
    _nativeAdmob.initialize(appID: "ca-app-pub-8811794994870209~9624947035");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.categoryName,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline.copyWith(
                  color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold),
            ),
          ),
          titleSpacing: 4.0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(18.0),
              child: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            CategoryGroupCardWidget(
              items: items,
              category: Category.CATEGORY,
            ),
            SizedBox(
              height: 16.0,
            ),
            // Container(
            //   child: NativeAdmobBannerView(
            //     adUnitID: "ca-app-pub-3940256099942544/2247696110",
            //     // style: BannerStyle.light, // enum dark or light
            //     showMedia: true, // whether to show media view or not
            //     contentPadding:
            //         EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0), // content padding
            //   ),
            // ),
            // CategoryGroupCardWidget(
            //   items: items,
            // ),
          ],
        ),
      ),
    );
  }
}
