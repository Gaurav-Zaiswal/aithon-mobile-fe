import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/controllers/feedlistview_controller.dart';
import 'package:scoreapp/controllers/submittedassignmentlist_view_controller.dart';
import 'package:scoreapp/widgets/assignment_widget.dart';
import 'package:scoreapp/widgets/feed_widget.dart';
import 'package:scoreapp/widgets/submitted_assignment_box_widget.dart';
// import 'package:scoreapp/screens/main_drawer_teacher.dart';
// import 'dart:ui' as ui;
// import 'package:scoreapp/utils/HeaderFooter.dart';
// import 'package:scoreapp/widgets/class_widget_t.dart';
// import 'package:scoreapp/widgets/textfield_widget_for_feed.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'create_class.dart';
import '../utils/detail_page_drawer_t.dart';

// classroom detail screen for teacher
class SubmittedAssignments extends StatefulWidget {
  @override
  _SubmittedAssignmentsState createState() => _SubmittedAssignmentsState();
  // _SubmittedAssignmentsState(id);
}

class _SubmittedAssignmentsState extends State<SubmittedAssignments> {
  String feed;
  SubmittedAssignmentListController assignmentController;
  int classroomId = int.parse(Get.parameters["id"]);

  _SubmittedAssignmentsState() {
    assignmentController =
        Get.put(SubmittedAssignmentListController(classroomId));
  }

  @override
  Widget build(BuildContext context) {
    Widget buildFeeds() => SliverToBoxAdapter(child: Obx(
          () {
            if (assignmentController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  // itemCount: assignmentController.feedList.length,
                  itemCount:
                      assignmentController.submittedAssignmentList.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, index) {
                    return AssignmentSolutionBox(
                      // classId: classroomId,
                      submittedAssignment:
                          assignmentController.submittedAssignmentList[index],
                    );
                  });
            }
          },
        ));
    // render a list of feeds that are posted in that class by teacher
    return Scaffold(
      appBar: AppBar(
          // title: Text(classId),
          title: Text("Class Feeds")),
      drawer: DetailPageDrawerTeacher(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/list-assignment/$classroomId"),
        child: Icon(Icons.assignment),
      ),
      body: CustomScrollView(
        slivers: [buildFeeds()],
      ),
      // body: Center(
      //   // child: TextFieldForFeed(classRoomId: this.classroomId),
      //   child: buildFeeds(),
      // ),
    );
  }
}
