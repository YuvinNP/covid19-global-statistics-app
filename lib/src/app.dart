import 'package:covid19outbreak_mobile/src/widgets/detail_view_card_global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../src/services/httpservices.dart';
import '../src/screens/hospital_view_screen.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: HospitalViewScreen(),
      ),
    );
  }
}

