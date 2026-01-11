import 'package:flutter/material.dart';
import 'package:my_project/pages/Mian/index.dart';
import 'package:my_project/pages/login/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    initialRoute: '/',
    routes: getRoutes(),
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.blue),
  );
}

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {'/': (context) => MainPage(), '/Login': (context) => LoginPage()};
}
