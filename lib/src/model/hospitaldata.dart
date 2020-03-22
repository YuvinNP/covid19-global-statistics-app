import 'package:flutter/foundation.dart';

import 'hospital.dart';

class HospitalData {

  final int id;
  final int hospitalID;
  final int treatmentTotal;
  final int treatmentLocal;
  final int treatmentForeign;
  final Hospital hospital;

  HospitalData({@required this.id,
      @required this.hospitalID,
      @required this.treatmentTotal,
      @required this.treatmentLocal,
      @required this.treatmentForeign,
      @required this.hospital
  });

}