import 'package:flutter/material.dart';
import 'package:scoreapp/screens/homescreen_t.dart';
import 'package:scoreapp/screens/loginscreen.dart';
import 'package:scoreapp/screens/student_registration.dart';
import 'package:scoreapp/screens/teacher_registration.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login App",
      // home: LoginScreen(),
      initialRoute:'/', 
      //When using initialRoute, don’t define a home property.
      routes: {
        '/': (context) => HomeScreen('apple'),
        '/register-teacher': (context) => TeacherRegistration(),
        '/register-student': (context) => StudentRegistration(),
        '/login': (context) => LoginScreen(),
        // '/landing-screen': (context) => HomeScreen(username),
      },
    );
  }
}
