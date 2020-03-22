import 'package:flutter/material.dart';
import '../util/constants.dart';

class DetailViewCard extends StatelessWidget {

  final String type;
  final int NewCases;
  final int TotalCases;
  final int TotalInHospitals;
  final int Deaths;
  final int NewDeaths;
  final int Recovered;



  DetailViewCard({@required this.type,
    @required this.NewCases,
    @required this.TotalCases,
    @required this.Deaths,
    @required this.NewDeaths,
    @required this.Recovered,
    this.TotalInHospitals
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Card(
        color: Colors.blue,
        elevation: 15,
        child: Column(
          children: <Widget>[
           Container(
             padding: EdgeInsets.all(25),
             child: Column(
                 children: <Widget>[
                   Row(
                     mainAxisAlignment:
                     MainAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         "Total Local Cases",
                         style: StyleConstants.TITLE_LABEL,
                       )
                     ],
                   ),
                   SizedBox(
                     height: 5,
                   ),
                   Row(
                     mainAxisAlignment:
                     MainAxisAlignment.center,
                     children: <Widget>[
                       Text('$TotalCases',
                         style: StyleConstants.NUMBER_TITLE_LABEL,
                       ),
                     ],
                   ),
                   Text(
                    NewCases != 0 ? '+' '$NewCases new cases': null,
                     style: StyleConstants.SUBTITLE_LABEL,
                   ),
                   SizedBox(
                     height: 25,
                   ),
                   Row(
                     mainAxisAlignment:
                     MainAxisAlignment.center,
                     children: <Widget>[
                       // Local Deaths
                       Expanded(
                         child: Column(
                           crossAxisAlignment:
                           CrossAxisAlignment.center,
                           children: <Widget>[
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text(
                                  '$Deaths',
                                   style: StyleConstants.SUBNUMBER_TITLE_LABEL,
                                 )
                               ],
                             ),
                             SizedBox(
                               height: 5,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text(
                                   "Deaths",
                                 style: StyleConstants.SUBTITLE_LABEL,
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
//
//                       SizedBox(
//                         width: 40,
//                       ),

                       // Local Recovered
                       Expanded(
                         child: Column(
                           crossAxisAlignment:
                           CrossAxisAlignment.center,
                           children: <Widget>[
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text(
                                    '$Recovered',
                                 style: StyleConstants.SUBNUMBER_TITLE_LABEL,)
                               ],
                             ),
                             SizedBox(
                               height: 5,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text(
                                   "Recovered",
                                 style: StyleConstants.SUBTITLE_LABEL,
                                 )
                               ],
                             )
                           ],
                         ),
                       ),

//                       SizedBox(
//                         width: 20,
//                       ),

                       // Local total in hospital
                        Expanded(
                         child: Column(
                           crossAxisAlignment:
                           CrossAxisAlignment.center,
                           children: <Widget>[
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                Text(
                                    '$TotalInHospitals',
                                   style: StyleConstants.SUBNUMBER_TITLE_LABEL,),
                               ],
                             ),
                             SizedBox(
                               height: 5,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text(
                                   "In Hospitals",
                                 style: StyleConstants.SUBTITLE_LABEL,
                                 )
                               ],
                             )
                           ],
                         ),
                       )
                     ],
                   )
                 ],
               ),
           ),

          ],
        ),
      ),
    );

  }
}
