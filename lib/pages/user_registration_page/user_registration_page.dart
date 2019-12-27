import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/service/auth_service.dart';
import 'package:tathastu/service/city_service.dart';
import 'package:tathastu/service/user_service.dart';
import 'package:intl/intl.dart';

class UserRegistrationPage extends StatefulWidget {
  final UserModel user;

  const UserRegistrationPage({Key key, this.user}) : super(key: key);

  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final GlobalKey<ScaffoldState> _phoneScaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _typeAheadController = TextEditingController();
  final GlobalKey<FormState> _registrationFormKey =
      GlobalKey<FormState>(debugLabel: 'phoneFormKey');
  final format = DateFormat("dd-MM-yyyy");
  String _displayName;
  String _email;
  String _pincode;
  int day, month, year;
  DateTime _birthdate;
  List<CityModel> cities;
  CityModel selectedCity;
  String _selectedCity;

  String _gender;

  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
      _nameController.text =
          (widget.user.displayName != null) ? widget.user.displayName : '';
      _emailController.text = widget.user.email;
      _birthdate = widget.user.birthdate;
      _birthdateController.text =
          (_birthdate != null) ? format.format(widget.user.birthdate) : '';
      selectedCity = CityModel(
        city: (widget.user.city != null) ? widget.user.city : '',
        district: (widget.user.district != null) ? widget.user.district : '',
        state: (widget.user.state != null) ? widget.user.state : '',
        pincode: (widget.user.pincode != null) ? widget.user.pincode : [],
      );
      _typeAheadController.text =
          (widget.user.city != null) ? widget.user.city : '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = Provider.of<AuthService>(context);

    final UserService _userService = Provider.of<UserService>(context);
    final AuthService authService = Provider.of<AuthService>(context);
    final CityService cityService = Provider.of<CityService>(context);

    print(_gender);

    return SafeArea(
      child: Scaffold(
        key: _phoneScaffoldKey,
        backgroundColor: Colors.blueGrey.shade50,
        body: Form(
          key: _registrationFormKey,
          child: ListView(
            padding: EdgeInsets.all(24.0),
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        authService.signOut();
                      },
                      child: Card(
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
                height: 48.0,
              ),
              Container(
                child: Text(
                  'Registration Details',
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
                child: TextFormField(
                  controller: _nameController,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Display Name',
                    hintStyle: GoogleFonts.lato(),
                    labelStyle: GoogleFonts.lato(),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Display name can not be empty.';
                    } else if (value.length < 3) {
                      return 'Display name must be of more than 2 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _displayName = value;
                    });
                  },
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _emailController,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subhead.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                    hintStyle: GoogleFonts.lato(),
                    labelStyle: GoogleFonts.lato(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                        "\\@" +
                        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                        "(" +
                        "\\." +
                        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                        ")+";
                    RegExp regExp = new RegExp(p);
                    if (value.isEmpty) {
                      return 'Email can not be empty.';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Email address is not valid.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
              ),
              Container(
                child: DateTimeField(
                  format: format,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subhead.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  controller: _birthdateController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Birthdate',
                    hintStyle: GoogleFonts.lato(),
                    labelStyle: GoogleFonts.lato(),
                  ),
                  onSaved: (value) {
                    setState(() {
                      _birthdate = value;
                    });
                  },
                  onShowPicker: (context, _birthdate) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: _birthdate ?? DateTime.now(),
                        lastDate: DateTime.now());
                  },
                ),
              ),
              Container(
                child: StreamBuilder<List<CityModel>>(
                    stream: cityService.getCities(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        cities = snapshot.data;
                        return TypeAheadFormField<CityModel>(
                            textFieldConfiguration: TextFieldConfiguration(
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'City/Pincode',
                                hintStyle: GoogleFonts.lato(),
                                labelStyle: GoogleFonts.lato(),
                              ),
                              controller: this._typeAheadController,
                            ),
                            suggestionsCallback: (pattern) {
                              return cities
                                  .where((s) => (s.city
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      (s.pincode.any((test) => (test
                                          .toLowerCase()
                                          .contains(pattern))))))
                                  .toList();
                            },
                            itemBuilder: (context, CityModel suggestion) {
                              return ListTile(
                                title: Text(
                                    '${suggestion.city} - ${suggestion.pincode}'),
                              );
                            },
                            transitionBuilder:
                                (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            onSuggestionSelected: (suggestion) {
                              this._typeAheadController.text = suggestion.city;
                              selectedCity = suggestion;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please select a city';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                this._selectedCity = value;
                              });
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Gender',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.subhead.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 32.0,
                    ),
                    Row(
                      children: <Widget>[
                        Card(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _gender = 'Male';
                              });
                            },
                            child: Container(
                              height: 120.0,
                              width: 120.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 16.0,
                                    left: 16.0,
                                    right: 16.0,
                                    bottom: 16.0,
                                    child: SvgPicture.asset('assets/male.svg'),
                                  ),
                                  Positioned(
                                    top: 4.0,
                                    left: 4.0,
                                    child: (_gender == 'Male')
                                        ? Icon(
                                            Icons.album,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 24.0,
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 24.0,
                        ),
                        Card(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _gender = 'Female';
                              });
                            },
                            child: Container(
                              height: 120.0,
                              width: 120.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 16.0,
                                    left: 16.0,
                                    right: 16.0,
                                    bottom: 16.0,
                                    child:
                                        SvgPicture.asset('assets/female.svg'),
                                  ),
                                  Positioned(
                                    top: 4.0,
                                    left: 4.0,
                                    child: (_gender == 'Female')
                                        ? Icon(
                                            Icons.album,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 24.0,
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(
          child: (_authService.loginStatus == LOGINSTATUS.VERIFYINGPHONE)
              ? Container(
                  height: 16.0,
                  width: 16.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 3.0,
                  ),
                )
              : Icon(Icons.arrow_forward_ios),
          onPressed: (_authService.loginStatus == LOGINSTATUS.VERIFYINGPHONE)
              ? null
              : () async {
                  if (_registrationFormKey.currentState.validate()) {
                    _registrationFormKey.currentState.save();

                    print(_displayName);
                    print(_email);
                    print(_birthdate.toString());
                    print(_pincode);
                    print(_gender);

                    _userService.updateUserDetails(_displayName, _email,
                        selectedCity, _birthdate, _gender);
                  }
                },
        ),
      ),
    );
  }
}
