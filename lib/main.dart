import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restapiget/model.dart';

import 'home_page.dart';

void main(){
  runApp(myApp());
}
class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        appBar: AppBar(),
      body: HomePage(),
      )
    );
  }
}