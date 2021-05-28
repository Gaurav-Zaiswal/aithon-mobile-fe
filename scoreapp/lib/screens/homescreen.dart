import 'package:flutter/material.dart';
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

  int _selectedIndex = 0;
  List<Widget> myWidgets = <Widget>[
    Container(
      child: Center(
        child: Text("Welcome to home"),
      ),
    ),
    Container(
      // child: Center(
      //   child: Text("Page to create the class"),
      // ),
      
    )
  ];

  int _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: myWidgets.elementAt(_selectedIndex),
      // ),
      appBar: AppBar(
        title: Text("Welcome, " + widget.username),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          myWidgets.elementAt(_selectedIndex),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.create), label: "Create Class"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
