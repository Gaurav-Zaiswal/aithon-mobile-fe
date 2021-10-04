import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/utils/secure_storage.dart';

class MainDrawerStudent extends StatelessWidget {
  // const MainDrawerStudent({ Key? key }) : super(key: key);
  final APIService _apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical:30),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Welcome back!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Get.toNamed("/home-student");
            },
          ),
          ListTile(
            leading: Icon(Icons.class_),
            title: Text(
              'Classroom', // video calling
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Get.toNamed("/classroom");
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.add),
          //   title: Text(
          //     'Join a class',
          //     style: TextStyle(
          //       fontSize: 18,
          //     ),
          //   ),
          //   onTap: null,
          // ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              UserSecureStorage.removeUserToken("token");
              // remove data preferences stored
              _apiService.removeUserDetails();
              Get.offAllNamed("/splash");
            },
          ),
        ],
      ),
    );
  }
}
