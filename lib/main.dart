import 'package:flutter/material.dart';
import 'package:newsappapi/ApiHelper.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

await  ApiHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home:  Home(),
    );
  }
}


