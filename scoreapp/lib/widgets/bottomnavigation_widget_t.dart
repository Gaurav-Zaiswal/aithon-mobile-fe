// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/screens/class_details_s.dart';
// import 'package:scoreapp/screens/class_details_t.dart';
// import 'package:scoreapp/screens/createmeeting.dart';
// import 'package:scoreapp/screens/detail_page_drawer_t.dart';
// import 'package:scoreapp/screens/joinmeeting.dart';

// class MyBottomNavigationT extends StatefulWidget {
//   // const MyBottomNavigationT({ Key? key }) : super(key: key);

//   @override
//   State<MyBottomNavigationT> createState() => _MyBottomNavigationTState();
// }

// class _MyBottomNavigationTState extends State<MyBottomNavigationT> {
// // bakwas code starts
// // trying to call CalssDetailsTeacher from here

//   int classroomId = int.parse(Get.parameters["id"]);
// // bakwas code ends
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   static List<Widget> _widgetOptions = <Widget>[
//     ClassDetailsTeacher(),
//     // ClassDetailsStudentScreen(), 
//     JoinMeeting(),
//     CreateMeeting()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Post Feed to classroom")),
//       drawer: DetailPageDrawerTeacher(),
//       body: Center(
//         child: Text("fsdfg"),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.connect_without_contact_sharp),
//               label: "Create Room"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.connect_without_contact), label: "Join Room"),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
