import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/service/auth_service.dart';
import 'package:tathastu/shared/flushbar_widget.dart';

class VerifyPhonePage extends StatefulWidget {
  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  final GlobalKey<ScaffoldState> _phoneScaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _phoneFormKey =
      GlobalKey<FormState>(debugLabel: 'phoneFormKey');
  String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = Provider.of<AuthService>(context);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    if (_authService.loginStatus == LOGINSTATUS.VERIFYPHONEFAILED) {
      Future.delayed(Duration.zero, () {
        showFlushBar(context, 'Phone verification is failed.Please try again.',
            Icons.error, Colors.red);
      });
    }

    return SafeArea(
      child: Scaffold(
        key: _phoneScaffoldKey,
        backgroundColor: Colors.blueGrey.shade50,
        body: Form(
          key: _phoneFormKey,
          child: ListView(
            padding: EdgeInsets.all(24.0),
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        height: 64.0,
                        width: 64.0,
                        padding: EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Tathastu',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 64.0,
              ),
              Container(
                child: Text(
                  'Tell us your phone number',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                child: TextFormField(
                  controller: _phoneController,
                  maxLength: 10,
                  style: GoogleFonts.lato(
                      textStyle:
                          Theme.of(context).textTheme.subhead.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Phone Number',
                    prefix: Text('+91  '),
                    hintStyle: GoogleFonts.lato(),
                    labelStyle: GoogleFonts.lato(),
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    setState(() {
                      _phoneNumber = '+91' + value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'A 6 digit OTP will be sent via sms to verity your mobile number.',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: Colors.grey.shade800),
                ),
              ),
              
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: (_authService.loginStatus == LOGINSTATUS.VERIFYINGPHONE)
              ? Container(
                  height: 16.0,
                  width: 16.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                    strokeWidth: 3.0,
                  ),
                )
              : Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).primaryColor,
                ),
          onPressed: (_authService.loginStatus == LOGINSTATUS.VERIFYINGPHONE)
              ? null
              : () {
                  if (_phoneFormKey.currentState.validate()) {
                    _phoneFormKey.currentState.save();
                    _authService.verifyPhoneNumber(_phoneNumber);
                  }
                },
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
