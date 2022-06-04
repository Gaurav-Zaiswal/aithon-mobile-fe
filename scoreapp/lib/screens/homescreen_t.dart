import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/controllers/classroom_controller.dart';
import 'package:scoreapp/utils/main_drawer_teacher.dart';
// import 'dart:ui' as ui;
// import 'package:scoreapp/utils/HeaderFooter.dart';
import 'package:scoreapp/widgets/class_widget_t.dart';
// import 'createclass.dart';

import 'dashboard_t.dart';
import 'forum.dart';
import 'library.dart';

// homepage for teacher
class HomeScreen extends StatefulWidget {
  // final String username;
  // const HomeScreen(this.username);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List classroomList = [];

  // final ClassroomController classroomController =
  //     Get.put(ClassroomController());

  int currentTab = 0;
  final List<Widget> screens = [DashboardTeacher(), Library(), Forum()];
  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentScreen = DashboardTeacher();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Class Joined'),
      // ),
      drawer: MainDrawerTeacher(),
      body: PageStorage(
        child: currentScreen,
        bucket: pageStorageBucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // left side of the add button 
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        currentScreen = DashboardTeacher();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        currentScreen = Library();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.library_books_rounded,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Library',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                  
                
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        currentScreen = Forum();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.groups,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Forum',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
