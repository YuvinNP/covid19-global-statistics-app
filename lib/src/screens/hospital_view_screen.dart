import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import '../model/datastats.dart';
import '../services/httpservices.dart';
import '../services/Logger.dart';
import '../widgets/detail_view_card.dart';
import '../widgets/detail_view_card_global.dart';


class HospitalViewScreen extends StatefulWidget {


  @override
  _HospitalViewScreenState createState() => _HospitalViewScreenState();
}

class _HospitalViewScreenState extends State<HospitalViewScreen> {

  HttpServices httpServices = HttpServices();


  Future<void> shareFile() async {
    final docs = await getApplicationDocumentsDirectory();
    if (docs.path == null) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: 'docs.path/log_file.txt',
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: httpServices.getData(),
        builder: (BuildContext context, AsyncSnapshot<DataStat> snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              Logger.log('Data not found');
              return Text('Could not found data!');
            case ConnectionState.waiting:
              Logger.log('Connection is Waiting');
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
              Logger.log('Connection is active');
              break;

            case ConnectionState.done:
              if (snapshot.hasError) {
                Logger.log('Connection Error');
                return Text('Error: ${snapshot.error}');
              }
              Logger.log('Connectivity Stablished, Connection state is done');
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
//                        Padding(
////                          padding: EdgeInsets.only(right: 25.0),
////                          child: Row(
////                            children: <Widget>[
////                              Align(
////                                  alignment: Alignment.centerRight,
////                                  child: Text('Last Updated: ${snapshot.data.lastUpdated}',
////                                    style: StyleConstants.SUBTITLE_LABEL2,)),
////                            ],
////                          ),
////                        ),
                  DetailViewCard(type: 'Local',
                    TotalCases: snapshot.data.local_total_cases,
                    NewCases: snapshot.data.local_new_cases,
                    Deaths: snapshot.data.local_deaths,
                    Recovered: snapshot.data.local_recovered,
                    TotalInHospitals: snapshot.data.local_total_in_hospitals,
                    NewDeaths: snapshot.data.local_new_deaths,
                  ),

                  DetailViewCardGlobal(type: 'Global',
                    TotalCases: snapshot.data.global_total_cases,
                    NewCases: snapshot.data.global_new_cases,
                    Deaths: snapshot.data.global_deaths,
                    Recovered: snapshot.data.global_recovered,
                    NewDeaths: snapshot.data.global_new_deaths,
                  ),
                  
                  RaisedButton(
                      child: Text('Share'),
                      onPressed: (){
                        shareFile();
                      })
                ],
              );
          }
          return null;
        },
      ),
    );
  }
}
