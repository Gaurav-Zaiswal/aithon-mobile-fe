import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/utils/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final UserSecureStorage userSecureStorage = UserSecureStorage();

  @override
  void initState() {
    _navigateToHomeOrLogin();

    super.initState();
  }

  _navigateToHomeOrLogin() async {
    final String token = await UserSecureStorage.getUserToken();

    await Future.delayed(
      Duration(milliseconds: 2000),
      () {
        token == null ? Get.offNamed("/login") : Get.offNamed("/");
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
            style: TextStyle(fontSize: 40,),
          ),
        ),
      ),
    );
  }
}
