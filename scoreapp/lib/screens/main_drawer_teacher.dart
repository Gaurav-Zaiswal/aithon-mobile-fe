import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/utils/secure_storage.dart';


class MainDrawerTeacher extends StatelessWidget 
{
  // const MainDrawerTeacher({ Key? key }) : super(key: key);
  APIService _apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Welcome, Teacher',
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
              Get.toNamed("/");
            },
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text(
              'Create Class',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Get.toNamed("/create-class");
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              'Join a class',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
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
