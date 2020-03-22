import 'package:flutter/material.dart';

class HospitalViewScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: buildView(context),
      ),
    );
  }
  
  Widget buildView(BuildContext context){
    return Column(
      children: <Widget>[
        Card(

        )
      ],
    );
  }
}
