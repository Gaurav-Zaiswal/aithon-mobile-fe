import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;
import "dart:convert";
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:scoreapp/models/login_model.dart';
import 'package:scoreapp/models/register_student_model.dart';
import 'package:scoreapp/models/register_teacher_model.dart';
import 'package:scoreapp/models/user_model.dart';
import 'package:scoreapp/utils/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  // login user
  bool login(LoginRequestModel requestModel) {
    // String url = "https://reqres.in/api/login/";
    String url = "https://gauravjaiswal.pythonanywhere.com/users/api/login/";
    http.post(Uri.parse(url), body: requestModel.toJson()).then((response) {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 400) {
        Map<String, dynamic> logInResponse = json.decode(response.body);
        if (logInResponse['token'] != null) {
          // store token on secure storage
          UserSecureStorage.setUserToken(logInResponse['token']);
          setUserDetails(logInResponse['token']);
          return true;

          // http.get(
          //     Uri.parse('https://gauravjaiswal.pythonanywhere.com/users/api/user-info/'),
          //     headers: {
          //       HttpHeaders.authorizationHeader:
          //           'Basic' + logInResponse['token'],
          //     }).then((r) async {
          //   final user = UserResponseModel.fromJson(json.decode(r.body));
          //   // use the token to store the logged in user's detail on shared preferences
          //   SharedPreferences prefs = await SharedPreferences.getInstance();
          //   prefs.setInt('id', user.id);
          //   prefs.setString('username', user.username);
          //   prefs.setString('email', user.email);
          //   prefs.setString('firstName', user.firstName);
          //   prefs.setString('lastName', user.lastName);
          //   prefs.setBool('isTeacher', user.isTeacher);
          //   prefs.setBool('isStudent', user.isStudent);
          // });
        } else {
          return false;
        }
      } else {
        throw Exception('Failed to load the Data!');
      }
    });
    return false;
  }

  void setUserDetails(String token) async {
    // get logined users details
    // returns boolean True if user's info was successfully written on shared preferences
    final response = await http.get(
      Uri.parse('https://gauravjaiswal.pythonanywhere.com/users/api/user-info'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Basic ' + token,
      },
    );
    final user = UserResponseModel.fromJson(json.decode(response.body));
    // use the token to store the logged in user's detail on shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', user.id);
    prefs.setString('email', user.email);
    prefs.setString('firstName', user.firstName);
    prefs.setString('lastName', user.lastName);
    prefs.setBool('isTeacher', user.isTeacher);
    prefs.setBool('isStudent', user.isStudent);
  }

  // register as teacher
  Future<RegisterTeacherResponseModel> registerTeacher(
      RegisterTeacherRequestModel requestModel) async {
    String url = "https://reqres.in/api/register/";
    // String url = "gauravjaiswal.pythonanywhere.com/users/api/teacher-register/";

    // final response = await http.post(url, body: requestModel.toJson());
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());

    // check the response
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      // invalid username pwd will have 400
      return RegisterTeacherResponseModel.fromJson(json.decode(response.body));
    } else {
      // print(response.statusCode);
      throw Exception('Failed to load the Data!');
    }
  }

  // ******** STUDENT REGISTRATION ************

  Future<RegisterStudentResponseModel> registerStudent(
      RegisterStudentRequestModel requestModel) async {
    String url = "https://reqres.in/api/register/";
    // String url = "gauravjaiswal.pythonanywhere.com/users/api/student-register/";

    // final response = await http.post(url, body: requestModel.toJson());
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());

    // check the response
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      // invalid username pwd will have 400
      return RegisterStudentResponseModel.fromJson(json.decode(response.body));
    } else {
      // print(response.statusCode);
      throw Exception('Failed to load the Data!');
    }
  }
}
