import 'package:api_project/core/constant.dart';
import 'package:api_project/core/theme_app.dart';
import 'package:flutter/material.dart';

import 'pages/HomePage/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: kThemeApp,
      home: HomeScreen(),
    );
  }
}
