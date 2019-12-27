import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/pages/login_page/login_page.dart';
import 'package:tathastu/pages/route_page/user_route_page.dart';
import 'package:tathastu/service/auth_service.dart';
import 'package:tathastu/service/user_service.dart';

class AuthRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
      builder: (context, AuthService authService, _) {
        switch (authService.authStatus) {
          case AUTHSTATUS.UNINITIALIZED:
                      case AUTHSTATUS.UNAUTHENTICATED:
            return LoginPage();
          case AUTHSTATUS.AUTHENTICATED:
            return ChangeNotifierProvider<UserService>(
              create: (BuildContext context) => UserService.instance(authService.user.uid, authService.user.phoneNumber),
              child: UserRoutePage(), );
          default:
            return LoginPage();
        }
      },
    ),
      )
    );
  }
}
