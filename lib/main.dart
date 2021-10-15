import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';
import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 /* @override
  void initState() {
    super.initState();
    Future.delayed(Duration(
      seconds: 3
    ),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),
      ));
      //Navigator.pop(context);
    },);
  }*/
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //systemNavigationBarColor: Colors.white,
        //systemNavigationBarIconBrightness: Brightness.dark
    ));
    return HomePage();
  }
}