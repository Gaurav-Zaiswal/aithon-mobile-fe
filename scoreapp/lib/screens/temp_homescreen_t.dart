// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/api/api_service.dart';
// import 'package:scoreapp/controllers/classroom_controller.dart';
// import 'package:scoreapp/models/home_screen_model.dart';
// import 'package:scoreapp/screens/main_drawer_teacher.dart';
// // import 'dart:ui' as ui;
// // import 'package:scoreapp/utils/HeaderFooter.dart';
// import 'package:scoreapp/widgets/class_widget_t.dart';
// import 'package:scoreapp/widgets/refreshindicator_widget.dart';
// // import 'createclass.dart';

// // homepage for teacher
// class HomeScreenTeacher extends StatefulWidget {
//   // final String username;
//   // const HomeScreenTeacher(this.username);

//   @override
//   _HomeScreenTeacherState createState() => _HomeScreenTeacherState();
// }

// class _HomeScreenTeacherState extends State<HomeScreenTeacher> {
//   List classroomList = [];

//   final ClassroomController classroomController =
//       Get.put(ClassroomController());

//   @override
//   void initState() {
//     // TODO: implement initState -> load the data when this page is visited
//     super.initState();
//     loadClassrooms();
//   }

//   // instantiating classroom controller
//   // ------------------> updated next 2 lines

//   @override
//   Widget build(BuildContext context) {
//     Widget buildClasses() => classroomList.isEmpty
//         ? Center(child: CircularProgressIndicator())
//         : RefreshIndicator(
//             onRefresh: loadClassrooms,
//             // physics: BouncingScrollPhysics(),
//             child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10),
//                 physics: const BouncingScrollPhysics(
//                   parent: AlwaysScrollableScrollPhysics(),
//                 ),
//                 itemCount: classroomList.length, // ------------> updated
//                 primary: false,
//                 shrinkWrap: true,
//                 itemBuilder: (BuildContext ctx, index) {
//                   return ClassBox(
//                     data: classroomList[index], // -----------------> updated
//                   );
//                   // return ClassBox("gaurav jaiswal 1234");
//                 }),
//           );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Class Joined'),
//       ),
//       drawer: MainDrawerTeacher(),
//       body: buildClasses(), // old
//     );
//   }

//   // refreshHome() {

//   // }

//   Future loadClassrooms() async {
//     // call the API to fetch the classrooms
//     final classroomList = classroomController.classroomList;
//     setState(() {
//       this.classroomList = classroomList;
//     });
//   }
// }
