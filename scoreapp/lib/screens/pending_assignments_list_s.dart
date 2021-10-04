import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/controllers/assignementlistview_controller.dart';
// import 'package:scoreapp/controllers/feedlistview_controller.dart';
import 'package:scoreapp/widgets/assignment_widget.dart';
// import 'package:scoreapp/widgets/feed_widget.dart';
// import 'package:scoreapp/screens/main_drawer_teacher.dart';
// import 'dart:ui' as ui;
// import 'package:scoreapp/utils/HeaderFooter.dart';
// import 'package:scoreapp/widgets/class_widget_t.dart';
// import 'package:scoreapp/widgets/textfield_widget_for_feed.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'create_class.dart';
import '../utils/detail_page_drawer_t.dart';

// classroom detail screen for teacher
class AssignmentListStudent extends StatefulWidget {
  @override
  _AssignmentListStudentState createState() => _AssignmentListStudentState();
}

class _AssignmentListStudentState extends State<AssignmentListStudent> {
  String assignment;
  AssignmentListController assignmentController;
  int classroomId = int.parse(Get.parameters["id"]);

  _AssignmentListStudentState() {
    assignmentController = Get.put(AssignmentListController(classroomId)); 
  }

  @override
  Widget build(BuildContext context) {
    Widget buildAssignments() => SliverToBoxAdapter(child: Obx(
      () {

        if (assignmentController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: assignmentController.assignmentList.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                return AssignmentBox(
                  assignment: assignmentController.assignmentList[index],
                  classId: classroomId,
                );
              });
        }
      },
    ));
    // render a list of feeds that are posted in that class by teacher
    return Scaffold(
      appBar: AppBar(
          title: Text("Pending Assignments")),
      // drawer: DetailPageDrawerTeacher(),
      body: Container(
      color: Colors.grey[200],

        child: CustomScrollView(
          slivers: [
            buildAssignments()
          ],
        ),
      ),
    );
  }
}
