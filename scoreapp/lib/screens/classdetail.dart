// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/controllers/feedlistview_controller.dart';
// import 'package:scoreapp/widgets/bottomnavigation_widget_t.dart';
// import 'package:scoreapp/widgets/feed_widget.dart';
// // import 'package:scoreapp/screens/main_drawer_teacher.dart';
// // import 'dart:ui' as ui;
// // import 'package:scoreapp/utils/HeaderFooter.dart';
// // import 'package:scoreapp/widgets/class_widget_t.dart';
// import 'package:scoreapp/widgets/textfield_widget_for_feed.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'create_class.dart';
// // import 'class_details_s.dart';
// // import 'class_details_t.dart';
// // import 'createmeeting.dart';
// import 'detail_page_drawer_t.dart';
// // import 'joinmeeting.dart';

// // classroom detail screen for teacher
// class ClassDetailScreenTeacher extends StatefulWidget {
//   // final int id;
//   // ClassDetailScreenTeacher(this.id);

//   @override
//   _ClassDetailScreenTeacherState createState() =>
//       _ClassDetailScreenTeacherState();
//   // _ClassDetailScreenTeacherState(id);
// }

// class _ClassDetailScreenTeacherState extends State<ClassDetailScreenTeacher> {
//   String feed;
//   bool hasTeacherRole;
//   FeedListController feedController;
//   int classroomId = int.parse(Get.parameters["id"]);

//   _ClassDetailScreenTeacherState() {
//     feedController = Get.put(FeedListController(classroomId));
//   }

//   // isTeacher() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   return prefs.getBool('isTeacher');
//   // }

//   @override
//   void initState() {
//     print("inside initstate");
//     Future.delayed(Duration.zero, () async {
//     print("inside initstate");

//       //your async 'await' codes goes here
//       // hasTeacherRole = await isTeacher();
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       hasTeacherRole = prefs.getBool('isTeacher');
//       print(hasTeacherRole);
//     });
//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     // if user is a teacher then render a text widget which can be used
//     // by them to post feed else
//     // render a list of feeds that are posted in that class by teacher

//     return Scaffold(
//       appBar: AppBar(
//           // title: Text(classId),
//           title: Text("Class Detail")
//         ),
//       drawer: DetailPageDrawerTeacher(),
//       // bottom navigation starts
//       bottomNavigationBar: MyBottomNavigation(),
    
//       // bottom navigation ends
//       body: Center(
//         child: TextFieldForFeed(classRoomId: this.classroomId),
//         // child: hasTeacherRole
//         //     ? TextFieldForFeed(classRoomId: this.classroomId)
//         //     : buildFeeds(),
//       ),
//     );
//   }

//   buildFeeds() {
//     // returns feedbox
//     SliverToBoxAdapter(child: Obx(
//       () {
//         if (feedController.isLoading.value)
//           return Center(child: CircularProgressIndicator());
//         else
//           return ListView.builder(
//               itemCount: feedController.feedList.length,
//               primary: false,
//               shrinkWrap: true,
//               itemBuilder: (BuildContext ctx, index) {
//                 return FeedBox(
//                   feed: feedController.feedList[index],
//                 );
//               });
//       },
//     ));
//   }
// }
