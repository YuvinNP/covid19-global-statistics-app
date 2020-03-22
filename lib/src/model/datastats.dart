import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../model/hospitaldata.dart';
import '../model/hospital.dart';

class DataStat {

  final DateTime lastUpdated;
  final int local_new_cases;
  final int local_total_cases;
  final int local_total_in_hospitals;
  final int local_deaths;
  final int local_new_deaths;
  final int local_recovered;
  final int global_new_cases;
  final int global_total_cases;
  final int global_new_deaths;
  final int global_deaths;
  final int global_recovered;
  final List<HospitalData> hospitaldata;

  DataStat({
      @required this.lastUpdated,
      @required this.local_new_cases,
      @required this.local_total_cases,
      @required this.local_total_in_hospitals,
      @required this.local_deaths,
      @required this.local_new_deaths,
      @required this.local_recovered,
      @required this.global_new_cases,
      @required this.global_total_cases,
      @required this.global_new_deaths,
      @required this.global_deaths,
      @required this.global_recovered,
      @required this.hospitaldata
  });

  factory DataStat.fromJson(Map<String, dynamic> json) {

    List<HospitalData> hospitalList = new List();

    json['hospital_data'].forEach((data) => hospitalList.add(
      new HospitalData(id: data['id'] as int,
          hospitalID: data['hospital_id'] as int,
          treatmentTotal: data['treatment_total'] as int,
          treatmentLocal: data['treatment_local'] as int,
          treatmentForeign: data['treatment_foreign'] as int,
          hospital: new Hospital(
            id: data['hospital']['id'] as int,
            name: data['hospital']['name'] as String,
            sinhalaName: data['hospital']['name_si'] as String
          )))
    );

    return DataStat(
      lastUpdated: DateTime.parse(json['update_date_time']),
      local_new_cases: json['local_new_cases'] as int,
      local_total_cases: json['local_total_cases'] as int,
      local_deaths: json['local_deaths'] as int,
      local_new_deaths: json['local_new_deaths'] as int,
      local_recovered: json['local_recovered'] as int,
      local_total_in_hospitals:
      json['local_total_number_of_individuals_in_hospitals'] as int,
      global_deaths: json['global_deaths'] as int,
      global_new_cases: json['global_new_cases'] as int,
      global_new_deaths: json['global_new_deaths'] as int,
      global_recovered: json['global_recovered'] as int,
      global_total_cases: json['global_total_cases'] as int,

    );

  }
}