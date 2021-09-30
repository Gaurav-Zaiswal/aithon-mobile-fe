import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/utils/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final UserSecureStorage userSecureStorage = UserSecureStorage();
  bool isTeacher, isStudent;
  @override
  void initState() {
    _navigateToHomeOrLogin();

    super.initState();
  }

  _navigateToHomeOrLogin() async {
    final String token = await UserSecureStorage.getUserToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isTeacher = prefs.getBool("isTeacher");
    isStudent = prefs.getBool("isStudent");
    await Future.delayed(
      Duration(milliseconds: 2000),
      () {
        // token == null ? Get.offNamed("/login") : Get.offNamed("/home-student");
        token == null ? Get.offNamed("/login") : directTOHome();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Aithon',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }

  directTOHome() {
    if (isStudent) {
      Get.offNamed("/home-student");
    } else if (isTeacher) {
      Get.offNamed("/home-teacher");
    } else {
      Get.offNamed("/login");
    }
  }
}
