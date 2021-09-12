import 'package:flutter/material.dart';

class HomeHeaderFooter extends StatefulWidget {
  const HomeHeaderFooter({Key key, @required this.size}) : super(key: key);
  final Size size;
  // HomeHeaderFooter({this.size});

  @override
  _HomeHeaderFooterState createState() => _HomeHeaderFooterState(size);
}

class _HomeHeaderFooterState extends State<HomeHeaderFooter> {
  Size size;
  _HomeHeaderFooterState(this.size);

  int _selectedIndex = 0;
  List<Widget> myWidgets = <Widget>[
    Container(
      child: Center(
        child: Text("Welcome to home"),
      ),
    ),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // calculate totla width and height of screen
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber[900],
        title: Text(
          'हाम्रो कक्षाकोठा',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.amber[900],
            backgroundImage: AssetImage("images/bttb-logo-final-2.png"),
            maxRadius: 20,
          ),
          Icon(Icons.more_vert_rounded)
        ],
      ),
      body: Column(children: [
        Container(
          // covers 10% of the height
          height: size.height * 0.2,
          child: Stack(
            children: [
              Text(size.height.toString()),
              Container(
                
                height: (size.height * 0.2 -27),
                decoration: BoxDecoration(
                    color: Colors.amber[900],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.black.withOpacity(0.3),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      "Your classes",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: new BottomNavigationBar(
        backgroundColor: Colors.amber[900],
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
