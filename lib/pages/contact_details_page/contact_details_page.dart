import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tathastu/shared/const.dart';

class ContactDetailsPage extends StatefulWidget {
  @override
  _ContactDetailsPageState createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> categories = [
    {
      'label': 'Plumber',
      'color': Colors.indigo,
      'background-color': Colors.indigo.shade50,
    },
    {
      'label': 'Electrician',
      'color': Colors.orange,
      'background-color': Colors.orange.shade50,
    },
    {
      'label': 'Carpenter',
      'color': Colors.pink,
      'background-color': Colors.pink.shade50,
    },
    {
      'label': 'Mechanic',
      'color': Colors.green,
      'background-color': Colors.green.shade50,
    },
    {
      'label': 'Consultant',
      'color': Colors.red,
      'background-color': Colors.red.shade50,
    },
  ];

  void choiceAction(String choice) {
    if (choice == 'Share') {
      print('Share');
    } else if (choice == 'Report') {
      print('Report');
    }
  }

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
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              icon: Icon(Icons.more_vert, size: 30.0),
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((Map<String, dynamic> choice) {
                  return PopupMenuItem<String>(
                    value: choice['label'],
                    child: Row(
                      children: <Widget>[
                        choice['icon'],
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(choice['label']),
                      ],
                    ),
                  );
                }).toList();
              },
            )
          ],
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
          // padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              // height: MediaQuery.of(context).size.height / 3,
              // color: Colors.indigo.shade50,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 128.0,
                    width: 128.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80.0),
                            child: Image.network(
                              'https://avatars2.githubusercontent.com/u/8781476?v=4',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 56.0,
                          width: 56.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Icon(
                            Icons.star,
                            size: 30.0,
                            color: Colors.amber,
                          ),
                          // elevation: 0.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Ketul Rastogi',
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.headline.copyWith(
                                        // color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: RatingBar(
                                  initialRating: 4.5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  glow: true,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                  ignoreGestures: true,
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Container(
                                child: Text(
                                  '4.5 (27 Ratings)',
                                  style: GoogleFonts.lato(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle
                                        .copyWith(
                                            // color: Colors.blueGrey.shade900,
                                            // fontWeight: FontWeight.w600,
                                            ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50.0,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> category = categories[index];
                  return Chip(
                    label: Text(
                      category['label'],
                      style: GoogleFonts.lato(
                        textStyle:
                            Theme.of(context).textTheme.subtitle.copyWith(
                                  color: category['color'],
                                  // fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    backgroundColor: category['background-color'],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 8.0,
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            ...<Widget>[
              ListTile(
                title: Text(
                  'About',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                subtitle: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                        // color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
              ),
              Divider(
                indent: 64.0,
              ),
              ListTile(
                title: Text(
                  'Phone',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          // color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                subtitle: Text(
                  '+919408393331',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                        // color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Divider(
                indent: 64.0,
              ),
              ListTile(
                title: Text(
                  'Address',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          // color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                subtitle: Text(
                  '28-29, Krushnapark Society, Near Gas Godawn, Hansapur, Patan.',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                        // color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.directions,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Divider(
                indent: 64.0,
              ),
              ListTile(
                title: Text(
                  'Email',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          // color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                subtitle: Text(
                  'ketul.rastogi@gmail.com.',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                        // color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Divider(
                indent: 64.0,
              ),
              ListTile(
                title: Text(
                  'Website',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          // color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                subtitle: Text(
                  'www.ketulrastogi.com.',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                        // color: Colors.blueGrey.shade800,
                        ),
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.public,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Divider(
                indent: 64.0,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
