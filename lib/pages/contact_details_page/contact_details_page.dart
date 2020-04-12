import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactDetailsPage extends StatefulWidget {
  @override
  _ContactDetailsPageState createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Contact Details',
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
          // padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              // color: Colors.indigo.shade50,
              child: Image.network(
                'https://avatars2.githubusercontent.com/u/8781476?v=4',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RatingBar(
                        initialRating: 3.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 24.0,
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
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        '3.5/5.0 ( 21 Ratings )',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.body1.copyWith(
                              // color: Colors.blueGrey.shade900,
                              // fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                  FloatingActionButton(
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    backgroundColor: Colors.indigo,
                    // elevation: 0.0,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            ...<Widget>[
              ListTile(
                leading: Container(
                  height: 40.0,
                  width: 40.0,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.label_important,
                  ),
                ),
                title: Text(
                  'Name',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.body1.copyWith(
                          color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
                subtitle: Text(
                  'Hari Om Parlour',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Divider(
                indent: 64.0,
              ),
              ListTile(
                leading: Container(
                  height: 40.0,
                  width: 40.0,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.phone_android,
                  ),
                ),
                title: Text(
                  'Phone',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.body1.copyWith(
                          color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
                subtitle: Text(
                  '+919408393331',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                  ),
                  onPressed: () {},
                ),
              ),
              Divider(
                indent: 64.0,
              ),
              ListTile(
                leading: Container(
                  height: 40.0,
                  width: 40.0,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.location_city,
                  ),
                ),
                title: Text(
                  'Address',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.body1.copyWith(
                          color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
                subtitle: Text(
                  '28-29, Krushnapark Society, Near Gas Godawn, Hansapur, Patan.',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.directions,
                  ),
                  onPressed: () {},
                ),
              ),
              Divider(
                indent: 64.0,
              ),
              ListTile(
                leading: Container(
                  height: 40.0,
                  width: 40.0,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.location_city,
                  ),
                ),
                title: Text(
                  'About',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.body1.copyWith(
                          color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
                subtitle: Text(
                  '28-29, Krushnapark Society, Near Gas Godawn, Hansapur, Patan.',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.directions,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
