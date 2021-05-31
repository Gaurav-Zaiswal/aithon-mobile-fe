import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;
import "dart:convert";
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:scoreapp/models/login_model.dart';
import 'package:scoreapp/models/register_student_model.dart';
import 'package:scoreapp/models/register_teacher_model.dart';
import 'package:scoreapp/models/user_model.dart';
// import 'package:scoreapp/utils/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  // login user
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    // String url = "https://reqres.in/api/login/";
    String url = "https://gauravjaiswal.pythonanywhere.com/users/api/login/";
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      // Map<String, dynamic> logInResponse = json.decode(response.body);
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load the Data!');
    }
  }

  void setUserDetails(String token) async {
    // get logined users details
    // returns boolean True if user's info was successfully written on shared preferences
    try {
      final r = await http.get(
        Uri.parse(
            'https://gauravjaiswal.pythonanywhere.com/users/api/user-info'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: 'token ${token}',
        },
      );
      if (r.statusCode == 200 || r.statusCode == 201 || r.statusCode == 400) {
        final user = UserResponseModel.fromJson(json.decode(r.body));
        // use the token to store the logged in user's detail on shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        try {
          prefs.setInt('id', user.id);
          // prefs.setString('email', user.email);
          prefs.setString('firstName', user.firstName);
          prefs.setString('lastName', user.lastName);
          prefs.setBool('isTeacher', user.isTeacher);
          prefs.setBool('isStudent', user.isStudent);
        } catch (e) {
          throw Exception(e);
        }
      } else {
        throw Exception("could not load the data");
      }
    } catch (e) {
      throw Exception(e);
    }
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
