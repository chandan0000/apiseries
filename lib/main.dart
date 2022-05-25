import 'package:apiseries/example_four.dart';
import 'package:apiseries/example_two.dart';
import 'package:apiseries/home_screen.dart';
import 'package:flutter/material.dart';

import 'ExampleThree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: ExampleFour(),
      // home:const HomeScreen(),
    );
  }
}

 