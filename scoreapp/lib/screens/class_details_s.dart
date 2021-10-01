import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/controllers/feedlistview_controller.dart';
import 'package:scoreapp/widgets/feed_widget.dart';
// import 'package:scoreapp/screens/main_drawer_teacher.dart';
// import 'dart:ui' as ui;
// import 'package:scoreapp/utils/HeaderFooter.dart';
// import 'package:scoreapp/widgets/class_widget_t.dart';
// import 'package:scoreapp/widgets/textfield_widget_for_feed.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'create_class.dart';
import 'detail_page_drawer_t.dart';

// classroom detail screen for teacher
class ClassDetailsStudent extends StatefulWidget {
  @override
  _ClassDetailsStudentState createState() => _ClassDetailsStudentState();
  // _ClassDetailsStudentState(id);
}

class _ClassDetailsStudentState extends State<ClassDetailsStudent> {
  String feed;
  FeedListController feedController;
  int classroomId = int.parse(Get.parameters["id"]);

  _ClassDetailsStudentState() {
    // print("4444444444444444444444444444444444444444444444444444444444444");
    feedController = Get.put(FeedListController(classroomId));
  }

  @override
  Widget build(BuildContext context) {
    Widget buildFeeds() => SliverToBoxAdapter(child: Obx(
      () {
        // print( "---------------------------> ${feedController.feedList.length}");

        if (feedController.isLoading.value) {
          // print("---> inside else block of buldFeeds() _ClassDetailsStudentState");

          return Center(child: CircularProgressIndicator());
        } else {
          // print("--> inside else block of buldFeeds() _ClassDetailsStudentState");
          return ListView.builder(
              itemCount: feedController.feedList.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                return FeedBox(
                  feed: feedController.feedList[index],
                );
              });
        }
      },
    ));
    // render a list of feeds that are posted in that class by teacher
    // print("------------ inside buld method of _ClassDetailsStudentState");
    return Scaffold(
      appBar: AppBar(
          // title: Text(classId),
          title: Text("Class Detail")),
      drawer: DetailPageDrawerTeacher(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/list-assignment/$classroomId"),
        child: Icon(Icons.assignment),
      ),
      body: CustomScrollView(
        slivers: [
          buildFeeds()
        ],
      ),
      // body: Center(
      //   // child: TextFieldForFeed(classRoomId: this.classroomId),
      //   child: buildFeeds(),
      // ),
    );
  }
}
