import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/controllers/classroom_controller.dart';
import 'package:scoreapp/utils/main_drawer_teacher.dart';
// import 'dart:ui' as ui;
// import 'package:scoreapp/utils/HeaderFooter.dart';
import 'package:scoreapp/widgets/class_widget_t.dart';
// import 'createclass.dart';

// homepage for teacher
class DashboardTeacher extends StatefulWidget {
  // final String username;
  // const DashboardTeacher(this.username);

  @override
  _DashboardTeacherState createState() => _DashboardTeacherState();
}

class _DashboardTeacherState extends State<DashboardTeacher> {
  List classroomList = [];

  // final ClassroomController classroomController =
  //     Get.put(ClassroomController());

  @override
  void initState() {
    // TODO: implement initState -> load the data when this page is visited
    super.initState();
    loadClassrooms();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildClasses() => SliverToBoxAdapter(
        child: classroomList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: loadClassrooms,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    // itemCount: classroomController.classroomList.length,
                    itemCount: classroomList.length,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext ctx, index) {
                      return ClassBox(
                        data: classroomList[index],
                      );
                      // return ClassBox("gaurav jaiswal 1234");
                    }),
              ));

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Class Joined'),
      // ),
      drawer: MainDrawerTeacher(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Joined Classes'),
            // title: Text(username),

            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 250,
            floating: true,
            stretch: true,
            // onStretchTrigger: loadClassrooms,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.unsplash.com/photo-1509062522246-3755977927d7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1104&q=80',
                fit: BoxFit.cover,
              ),
              stretchModes: [
                StretchMode.fadeTitle,
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

  Future loadClassrooms() async {
    // call the API to fetch the classrooms
    classroomList = await APIService.getClassrooms();
    // final classroomList = classroomController.classroomList;
    // print("classrooms are being loaded -------->${classroomList.last.className}");
    setState(() {
      this.classroomList = classroomList;
    });
  }
}
