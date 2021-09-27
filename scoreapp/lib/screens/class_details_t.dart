import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:scoreapp/screens/main_drawer_teacher.dart';
// import 'dart:ui' as ui;
// import 'package:scoreapp/utils/HeaderFooter.dart';
// import 'package:scoreapp/widgets/class_widget_t.dart';
import 'package:scoreapp/widgets/textfield_widget_for_feed.dart';
// import 'create_class.dart';
import 'detail_page_drawer_t.dart';

// classroom detail screen for teacher
class ClassDetailScreenTeacher extends StatefulWidget {
  // final int id;
  // ClassDetailScreenTeacher(this.id);

  @override
  _ClassDetailScreenTeacherState createState() =>
      _ClassDetailScreenTeacherState();
  // _ClassDetailScreenTeacherState(id);
}

class _ClassDetailScreenTeacherState extends State<ClassDetailScreenTeacher> {
  String feed;
  int classroomId = int.parse(Get.parameters["id"]);
  // _ClassDetailScreenTeacherState(id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(classId),
          title: Text("Class Detail")),
      drawer: DetailPageDrawerTeacher(),
      body: Center(
        child: TextFieldForFeed(classRoomId: this.classroomId),
      ),
    );
  }
}
