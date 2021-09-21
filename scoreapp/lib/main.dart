import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:scoreapp/screens/class_details_t.dart';
import 'package:scoreapp/screens/createclass.dart';
import 'package:scoreapp/screens/homescreen_t.dart';
import 'package:scoreapp/screens/loginscreen.dart';
import 'package:scoreapp/screens/splash_screen.dart';
import 'package:scoreapp/screens/student_registration.dart';
import 'package:scoreapp/screens/teacher_registration.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Login App",
      // home: LoginScreen(),
      initialRoute:'/splash', 
      //When using initialRoute, don’t define a home property.
      // routes: {  
      //   '/': (context) => ClassDetailScreenTeacher('apple'),
      //   // '/': (context) => HomeScreen('apple'),
      //   '/register-teacher': (context) => TeacherRegistration(),
      //   '/register-student': (context) => StudentRegistration(),
      //   '/login': (context) => LoginScreen(),
      //   // '/landing-screen': (context) => HomeScreen(username),
      // },

      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: "/", page: () => HomeScreen("Test User")),
        GetPage(name: "/landing-screen", page: () => HomeScreen("Test User")),
        GetPage(name: "/register-teacher", page: () => TeacherRegistration()),
        GetPage(name: "/register-student", page: () => StudentRegistration()),
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/logout", page: () => LoginScreen()),

        GetPage(name: "/create-class", page: () => CreateClass()),
        GetPage(name: "/view-class", page: () => ClassDetailScreenTeacher('teacher')),
        GetPage(name: "/create-assignemnt", page: () => LoginScreen()),
        GetPage(name: "/logout", page: () => LoginScreen()),
      ]
    ); 
  }
}
