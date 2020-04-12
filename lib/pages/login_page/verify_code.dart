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
        backgroundColor: Colors.white,
        body: Form(
          key: _codeFormKey,
          child: ListView(
            padding: EdgeInsets.all(24.0),
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 64.0,
                      width: 64.0,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'Tathastu',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline
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
                    textStyle: Theme.of(context).textTheme.title.copyWith(
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
                  // backgroundColor: Colors.blueGrey.shade50,
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
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.grey.shade800),
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    '${_authService.phoneNumber}.',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.caption.copyWith(
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
                  Icon(Icons.arrow_left, color: Theme.of(context).primaryColor),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    'BACK',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subtitle.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _authService.restartVerification();
              },
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: (_authService.loginStatus == LOGINSTATUS.VERIFYINGCODE)
                  ? Container(
                      height: 16.0,
                      width: 16.0,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 3.0,
                      ),
                    )
                  : Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
              onPressed:
                  (_authService.loginStatus == LOGINSTATUS.VERIFYINGCODE ||
                          _smsCode == null ||
                          _smsCode.length == 0)
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
