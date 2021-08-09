import 'package:flutter/material.dart';
import 'package:poke_dex/router/router.dart';
import 'package:poke_dex/screens/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerate.generateRoute,
      home: HomePage()
    );
  }
}