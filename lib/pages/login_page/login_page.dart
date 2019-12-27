import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/pages/login_page/verify_code.dart';
import 'package:tathastu/pages/login_page/verify_phone.dart';
import 'package:tathastu/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
          builder: (context, AuthService authService, _) {

            switch (authService.loginStatus) {
              case LOGINSTATUS.UNINITIALIZED:
                return VerifyPhonePage();
              case LOGINSTATUS.VERIFYINGPHONE:
                return VerifyPhonePage();
              case LOGINSTATUS.VERIFYPHONEFAILED:
                return VerifyPhonePage();
              case LOGINSTATUS.SMSCODESENT:
                return VerifyCodePage();
              case LOGINSTATUS.VERIFYINGCODE:
                return VerifyCodePage();
              case LOGINSTATUS.VERIFYCODEFAILED:
                return VerifyCodePage();
              default:
                return VerifyPhonePage();
            }
          },
        ),
      ),
    );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
}

class OldSingleChildScrollView extends StatelessWidget {
  const OldSingleChildScrollView({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey.shade50, Colors.blueGrey.shade100],
          stops: [0.4, 0.9],
        )),
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Tathastu',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.display1.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                ),
              ),
            ),
            Container(
              width: width,
              height: 300.0,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Your Phone!',
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.blueGrey.shade800),
                        ),
                      ),
                      TextFormField(
                        maxLength: 10,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                                                    labelText: 'Phone Number',
                          prefix: Text('+91 | '),
                          hintStyle: GoogleFonts.roboto(
                            textStyle: Theme.of(context)
                                .textTheme
                                .subhead
                                .copyWith(color: Colors.blueGrey.shade800),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      Text(
                        'A 6 digit OTP will be sent via sms to verity your mobile number.',
                        style: GoogleFonts.roboto(
                          textStyle:
                              Theme.of(context).textTheme.caption.copyWith(
                                                                    color: Colors.blueGrey.shade500),
                        ),
                      ),
                      InkWell(
                                                child: Container(
                          width: 56.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_left,
                                color: Theme.of(context).accentColor,
                              ),
                              Text(
                                'BACK',
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: Theme.of(context).accentColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(),
                ),
                RaisedButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  color: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'CONTINUE',
                        style: GoogleFonts.raleway(
                          textStyle: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Icon(Icons.arrow_right,
                                                    color: Colors.white)
                    ],
                  ),
                  onPressed: () {},
                ),
                Flexible(
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OldListVIew extends StatelessWidget {
  const OldListVIew({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(24.0),
      children: <Widget>[
        SizedBox(
          height: height / 8,
        ),
        Text(
          'Mobile Number',
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline.copyWith(
                fontWeight: FontWeight.w900, color: Colors.blueGrey.shade800),
          ),
        ),
        SizedBox(
          height: height / 12,
        ),
        Text(
          'Enter your mobile number to begin',
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.subtitle.copyWith(
                color: Colors.blueGrey.shade700, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                width: 56.0,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: '+91'),
                ),
              ),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone number',
                    hintStyle: GoogleFonts.raleway(
                      textStyle: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.blueGrey.shade800),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Change Mobile Number'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Enter OTP'),
                  Text('Time left - 01:57'),
                ],
              ),
              PinCodeTextField(
                length: 6,
                obsecureText: false,
                animationType: AnimationType.fade,
                shape: PinCodeFieldShape.box,
                animationDuration: Duration(milliseconds: 300),
                borderRadius: BorderRadius.circular(5),
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                borderWidth: 1.0,
                fieldHeight: 50,
                fieldWidth: 40,
                onChanged: (value) {
                                                                      },
              )
            ],
          ),
        ),
        SizedBox(
          height: height / 4,
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.indigoAccent,
                        blurRadius: 2.0,
                        spreadRadius: 1.0)
                  ]),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                child: Row(
                  children: <Widget>[
                    Text(
                      'NEXT',
                      style: GoogleFonts.raleway(
                        textStyle: Theme.of(context).textTheme.button.copyWith(
                            fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).accentColor,
                    )
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: height / 30,
        ),
        Center(
          child:
              Text('By signing up, you agree to our terms and privacy policy'),
        ),
      ],
    );
  }
}
