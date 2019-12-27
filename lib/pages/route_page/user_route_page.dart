import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/pages/home_page/home_page.dart';
import 'package:tathastu/pages/user_registration_page/user_registration_page.dart';
import 'package:tathastu/service/auth_service.dart';
import 'package:tathastu/service/user_service.dart';

class UserRoutePage extends StatefulWidget {
  final String userId;

  const UserRoutePage({Key key, this.userId}) : super(key: key);
  @override
  _UserRoutePageState createState() => _UserRoutePageState();
}

class _UserRoutePageState extends State<UserRoutePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
      builder: (context, UserService userService, _) {
        switch (userService.userStatus) {
          case USERSTATUS.NOTUPDATED:
            return UserRegistrationPage(user: userService.user,);
          case USERSTATUS.UPDATED:
            return HomePage();
          default:
            return UserRegistrationPage();
        }
      },
    ),
      )
    );
  }
}
