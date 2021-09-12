import 'package:flutter/material.dart';
import 'package:scoreapp/screens/main_drawer_teacher.dart';
import 'dart:ui' as ui;
import 'package:scoreapp/utils/HeaderFooter.dart';
import 'createclass.dart';

// homepage for teacher
class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen(this.username);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // _HomeScreenState(this.username);

  // int _selectedIndex = 0;
  // List<Widget> myWidgets = <Widget>[
  //   Container(
  //     child: Center(
  //       child: Text("Welcome to home"),
  //     ),
  //   ),
  //   Container(
  //       // child: Center(
  //       //   child: Text("Page to create the class"),
  //       // ),

  //       )
  // ];

  // int _onItemTap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // final semiCircle = CustomPaint(
  //   painter: DrawSemiCircle(),
  //   child: Text('username here'),
  // );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Class Joined'),
      ),
      drawer: MainDrawerTeacher(),
      body: Center(

      ),
    );
  }
}
