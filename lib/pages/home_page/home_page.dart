import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/pages/category_types_page/category_types_page.dart';
import 'package:tathastu/pages/contact_list_page/contact_list_page.dart';
import 'package:tathastu/service/auth_service.dart';
import 'package:tathastu/shared/carousel_slider_widget.dart';
import 'package:tathastu/shared/categories_card.dart';
import 'package:tathastu/shared/emergency_services_card_widget.dart';
import 'package:tathastu/shared/newspaper-small.dart';
import 'package:tathastu/shared/repair_services_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Provider.of<AuthService>(context);

    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              'Tathastu',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline.copyWith(
                    color: Colors.blueGrey.shade900,
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Patan',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.blueGrey.shade800),
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Icon(Icons.edit_location,
                        size: 24.0, color: Colors.blueGrey.shade800),
                  ],
                ),
                onPressed: () {},
              ),
            ],
            titleSpacing: 4.0,
            leading: InkWell(
              onTap: () => _scaffoldKey.currentState.openDrawer(),
              child: Container(
                padding: EdgeInsets.all(18.0),
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
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
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'Ketul Rastogi',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  accountEmail: Text(
                    '+919408393331',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  currentAccountPicture: SvgPicture.asset(
                    'assets/male.svg',
                  ),
                  arrowColor: Colors.transparent,
                  onDetailsPressed: () {},
                ),
                ListTile(
                  leading: Container(
                    height: 24.0,
                    width: 24.0,
                    margin: EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/clipboard.svg',
                    ),
                  ),
                  title: Text(
                    'Manage Pages',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.blueGrey.shade800,
                          ),
                    ),
                  ),
                ),
                Divider(
                  indent: 64.0,
                ),
                ListTile(
                  leading: Container(
                    height: 24.0,
                    width: 24.0,
                    margin: EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/team.svg',
                    ),
                  ),
                  title: Text(
                    'About Us',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.blueGrey.shade800,
                          ),
                    ),
                  ),
                ),
                Divider(
                  indent: 64.0,
                ),
                ListTile(
                  leading: Container(
                    height: 24.0,
                    width: 24.0,
                    margin: EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/contact.svg',
                    ),
                  ),
                  title: Text(
                    'Contact Us',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.blueGrey.shade800,
                          ),
                    ),
                  ),
                ),
                Divider(
                  indent: 64.0,
                ),
                ListTile(
                  leading: Container(
                    height: 24.0,
                    width: 24.0,
                    margin: EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/terms-and-conditions.svg',
                    ),
                  ),
                  title: Text(
                    'Terms & Conditions',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.blueGrey.shade800,
                          ),
                    ),
                  ),
                ),
                Divider(
                  indent: 64.0,
                ),
                ListTile(
                  leading: Container(
                    height: 24.0,
                    width: 24.0,
                    margin: EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/secure-data.svg',
                    ),
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.blueGrey.shade800,
                          ),
                    ),
                  ),
                ),
                Divider(
                  indent: 64.0,
                ),
                ListTile(
                  leading: Container(
                    height: 24.0,
                    width: 24.0,
                    margin: EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/logout.svg',
                    ),
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.blueGrey.shade800,
                          ),
                    ),
                  ),
                ),
                Divider(
                  indent: 64.0,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: ListView(
            padding: EdgeInsets.only(
              top: 8.0,
            ),
            children: <Widget>[
              CarouselSliderWidget(),
              // SizedBox(height: 8.0,),
              // RepairServiceCardWidget(),
              Divider(),
              Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                  bottom: 4.0,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'What would you like to search today?',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          fontWeight: FontWeight.bold,
                          // color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              CategoriesCardWidget(),
              SizedBox(
                height: 8.0,
              ),
              // InkWell(
              //   onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ContactListPage(),
              //   ),
              // );
              //   },
              //   child: EmergencyServicesCardWidget(),
              // ),
            ],
          )),
    );
  }
}
