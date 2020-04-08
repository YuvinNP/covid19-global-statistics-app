import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:path_provider/path_provider.dart';
import 'src/services/Logger.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  var docsDir = await _getDocsDir();
  String canonicalFileName = '$docsDir/$_logFileName';
  await Logger.initializeLogging(canonicalFileName);
  await Logger.log('Application Started!!!');
  runApp(App());
}

Future<String> _getDocsDir() async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

var _logFileName = 'log_file.txt';