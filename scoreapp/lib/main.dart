import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:scoreapp/screens/class_details_s.dart';
import 'package:scoreapp/screens/class_details_t.dart';
import 'package:scoreapp/screens/create_class.dart';
// import 'package:scoreapp/screens/createclass.dart';
import 'package:scoreapp/screens/homescreen_s.dart';
import 'package:scoreapp/screens/homescreen_t.dart';
import 'package:scoreapp/screens/loginscreen.dart';
import 'package:scoreapp/screens/pending_assignments_list_s.dart';
import 'package:scoreapp/screens/splash_screen.dart';
import 'package:scoreapp/screens/student_registration.dart';
import 'package:scoreapp/screens/submitted_assignment_list.dart';
import 'package:scoreapp/screens/teacher_registration.dart';
import 'package:scoreapp/screens/videoconferencescreen.dart';

import 'screens/temp_homescreen_t.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      // home: LoginScreen(),
      initialRoute:'/splash', 
      //When using initialRoute, don’t define a home property.
      // all id are classroomid unless specified seperetely
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: "/", page: () => HomeScreen()),
        // GetPage(name: "/home-teacher", page: () => HomeScreenTeacher()),  // temp path for home page techer
        GetPage(name: "/home-teacher", page: () => HomeScreen()), // permananet path for home page techer
        GetPage(name: "/home-student", page: () => HomeScreenStudent()),
        GetPage(name: "/register-teacher", page: () => TeacherRegistration()),
        GetPage(name: "/register-student", page: () => StudentRegistration()),
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/logout", page: () => LoginScreen()),

        // GetPage(name: "/create-class", page: () => CreateClass()),
        GetPage(name: "/create-class", page: () => CreateClassroom()),
        GetPage(name: "/view-class-teacher/:id", page: () => ClassDetailsTeacher()),
        GetPage(name: "/view-class-student/:id", page: () => ClassDetailsStudent()),
        GetPage(name: "/classroom", page: () => VideoConferenceScreen()),
        GetPage(name: "/create-assignemnt", page: () => LoginScreen()),
        GetPage(name: "/list-assignment/:id", page: () => AssignmentListStudent()),
        GetPage(name: "/submitted-assignment/:id", page: () => SubmittedAssignments())
      ]
    ); 
  }
}
