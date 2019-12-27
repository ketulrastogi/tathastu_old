import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/pages/route_page/auth_route.dart';
import 'package:tathastu/service/auth_service.dart';
import 'package:tathastu/service/city_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService.instance(),
        ),
        ChangeNotifierProvider<CityService>(
          create: (context) => CityService.instance(),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.indigo,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthRoutePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(24.0),
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Tathastu',
                style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.display2.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
