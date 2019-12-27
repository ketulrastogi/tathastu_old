import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItemWidget extends StatelessWidget {
  final String iconUrl, title;

  const CategoryItemWidget({Key key, this.iconUrl, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: new Container(
        // margin: EdgeInsets.all(4.0),
        
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
                style: GoogleFonts.roboto(
              textStyle: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.blueGrey.shade800,),
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
