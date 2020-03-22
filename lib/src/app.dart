import 'package:covid19outbreak_mobile/src/widgets/detail_view_card_global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../src/services/httpservices.dart';
import '../src/model/datastats.dart';
import '../src/widgets/detail_view_card.dart';
import '../src/util/constants.dart';
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
          body: Container(
            child: FutureBuilder(
              future: httpServices.getData(),
              builder: (BuildContext context, AsyncSnapshot<DataStat> snapshot){
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Could not found data!');
                    
                  case ConnectionState.waiting:  
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                Colors.redAccent
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                    
                  case ConnectionState.active:
                  break;
                  
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                     return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 50.0,),
                        Align(
                            alignment: Alignment.center,
                            child: Text('COVID-19 GLOBAL STATISTICS',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        SizedBox(
                        height: 40.0,
                        ),
//                          Padding(
//                            padding: EdgeInsets.only(right: 20.0),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: <Widget>[
//                                IconButton(icon: Icon(Icons.refresh,
//                                size: 30.0,), onPressed: (){}),
//                                Align(
//                                  alignment: Alignment.centerRight,
//                                  child: Text('Last Updated: ${snapshot.data.lastUpdated}',
//                                    style: StyleConstants.SUBTITLE_LABEL2,
//                                  ),
//
//                                ),
//
//                              ],
//
//                            ),
//                              ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return HospitalViewScreen();
                            }));
                          },
                          child: Hero(
                            tag: 'listHero',
                            child: DetailViewCard(type: 'Local',
                              TotalCases: snapshot.data.local_total_cases,
                              NewCases: snapshot.data.local_new_cases,
                              Deaths: snapshot.data.local_deaths,
                              Recovered: snapshot.data.local_recovered,
                              TotalInHospitals: snapshot.data.local_total_in_hospitals,
                              NewDeaths: snapshot.data.local_new_deaths,
                            ),
                          ),
                        ),

                        DetailViewCardGlobal(type: 'Global',
                          TotalCases: snapshot.data.global_total_cases,
                          NewCases: snapshot.data.global_new_cases,
                          Deaths: snapshot.data.global_deaths,
                          Recovered: snapshot.data.global_recovered,
                          NewDeaths: snapshot.data.global_new_deaths,
                        ),
                      ],
                     );
                }
                return null;
              },
            ),
          ),
      ),
    );
  }
}

