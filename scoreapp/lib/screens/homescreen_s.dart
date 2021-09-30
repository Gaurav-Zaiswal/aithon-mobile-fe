import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/controllers/classroom_controller.dart';
import 'package:scoreapp/models/classroon_join_model.dart';
import 'package:scoreapp/screens/main_drawer_teacher.dart';
import 'dart:ui' as ui;
import 'package:scoreapp/utils/HeaderFooter.dart';
import 'package:scoreapp/widgets/bottomsheet_widget_s.dart';
import 'package:scoreapp/widgets/class_widget_s.dart';
import 'package:scoreapp/widgets/class_widget_t.dart';
import 'createclass.dart';

// homepage for teacher
class HomeScreenStudent extends StatefulWidget {
  // final String username;
  // const HomeScreenStudent(this.username);

  @override
  _HomeScreenStudentState createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  // instantiating classroom controller
  final ClassroomController classroomController =
      Get.put(ClassroomController());

  @override
  Widget build(BuildContext context) {
    Widget buildClasses() => SliverToBoxAdapter(child: Obx(
          () {
            if (classroomController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: classroomController.classroomList.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, index) {
                    return ClassBoxStudent(
                      data: classroomController.classroomList[index],
                    );
                    // return ClassBox("gaurav jaiswal 1234");
                  });
          },
        ));

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Class Joined'),
      // ),
      drawer: MainDrawerTeacher(),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: poupJoin(context),
      //   label: Text("Join"),
      //   splashColor: Colors.grey[400],
      // ),
      floatingActionButton: MyFloatingActionButton(),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Joined Classes'),
            // title: Text(username),

            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 250,
            floating: true,
            stretch: true,
            // onStretchTrigger: () {
            //   // return buildClasses();
            // },
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.unsplash.com/photo-1509062522246-3755977927d7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1104&q=80',
                fit: BoxFit.cover,
              ),
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              centerTitle: true,
            ),
          ),

          // add classes grid here
          buildClasses(),
        ],
      ),
    );
  }

  refreshScreen() {
    // add classes grid here
    // buildClasses()
  }
}
