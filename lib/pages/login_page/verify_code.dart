import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/service/auth_service.dart';
import 'package:tathastu/shared/flushbar_widget.dart';

class VerifyCodePage extends StatefulWidget {
  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final GlobalKey<ScaffoldState> _codeScaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _codeFormKey =
      GlobalKey<FormState>(debugLabel: 'phoneFormKey');
  String _smsCode;

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = Provider.of<AuthService>(context);

    if (_authService.loginStatus == LOGINSTATUS.VERIFYCODEFAILED) {
      Future.delayed(Duration.zero, () {
        showFlushBar(
            context,
            'Wrong verifcation code is entered.Please enter correct code.',
            Icons.error,
            Colors.red);
      });
    }

    return SafeArea(
      child: Scaffold(
        key: _codeScaffoldKey,
        backgroundColor: Colors.blueGrey.shade50,
        body: Form(
          key: _codeFormKey,
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
                  'Enter verification code',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                child: PinCodeTextField(
                  length: 6,
                  activeColor: Theme.of(context).primaryColor,
                  selectedColor: Theme.of(context).primaryColor,
                  inactiveColor: Colors.black,
                  backgroundColor: Colors.blueGrey.shade50,
                  textStyle: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  textInputType: TextInputType.number,
                  onChanged: (String value) {
                    setState(() {
                      _smsCode = value;
                    });
                  },
                  onCompleted: (value) {
                    setState(() {
                      _smsCode = value;
                    });
                  },
                  controller: _codeController,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Enter sms code you received to ',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: Colors.grey.shade800),
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    '${_authService.phoneNumber}.',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.body1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.only(left: 32.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_left, color: Colors.grey),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    'BACK',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          fontWeight: FontWeight.w800, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _authService.restartVerification();
              },
            ),
            FloatingActionButton(
              backgroundColor: Colors.white,
              child: (_authService.loginStatus == LOGINSTATUS.VERIFYINGCODE)
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
              onPressed: (_authService.loginStatus == LOGINSTATUS.VERIFYINGCODE)
                  ? null
                  : () {
                      if (_codeFormKey.currentState.validate()) {
                        _codeFormKey.currentState.save();
                        if (_smsCode.length != 6) {
                          showFlushBar(
                              context,
                              'Verifcation Code must be of 6 digits.Please enter correct code.',
                              Icons.error,
                              Colors.red);
                        } else {
                          _authService.signInWithPhoneNumber(_smsCode);
                        }
                      }
                    },
            ),
          ],
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
