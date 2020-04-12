import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tathastu/pages/contact_details_page/contact_details_page.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Contact Lists',
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
        body: ListView.separated(
          padding:
              EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailsPage(),
                  ),
                );
              },
              title: Text(
                'Hari Om Parlour',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.subhead.copyWith(
                      color: Colors.blueGrey.shade900,
                      fontWeight: FontWeight.w600),
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  RatingBar(
                    initialRating: 3.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 16.0,
                    glow: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    ignoreGestures: true,
                  ),
                  Text(
                    '3.5/5.0',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.body1.copyWith(
                          // color: Colors.blueGrey.shade900,
                          // fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              // isThreeLine: true,
              leading: Icon(
                Icons.person,
                size: 48.0,
                color: Colors.indigo,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 16.0,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    '500 Mtr',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.caption.copyWith(
                          // color: Colors.blueGrey.shade900,
                          // fontWeight: FontWeight.w600,
                          ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, indext) {
            return Divider();
          },
        ),
      ),
    );
  }
}
