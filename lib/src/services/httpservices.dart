import 'dart:convert';
import 'package:http/http.dart';
import '../model/datastats.dart';
import '../services/Logger.dart';

class HttpServices {
  final String url =
      "http://hpb.health.gov.lk/api/get-current-statistical";

  Future<DataStat> getData() async {
    Response response = await get(url);

    if(response.statusCode == 200) {

      await Logger.log('Reqest Successfull, Data Retrived from $url');
      return DataStat.fromJson(jsonDecode(response.body)['data']);
    }
  }
}