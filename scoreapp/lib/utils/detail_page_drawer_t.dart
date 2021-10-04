import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageDrawerTeacher extends StatelessWidget {
  final int classId;
  // const DetailPageDrawerTeacher({Key key, @required classId}) : super(key: key);
  DetailPageDrawerTeacher({@required this.classId});

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
                    'Aithon classroom',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Text(
                  //   'Class Code:',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // Text(
                  //   'QsH56t',
                  //   style: TextStyle(
                  //     fontSize: 22,
                  //   ),
                  // ),
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
            onTap: () => Get.toNamed("/home-teacher"),
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text(
              'Assignment Submissions',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () => Get.toNamed("/submitted-assignment/$classId"),
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text(
              'Classroom',
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
            onTap: null,
          ),
        ],
      ),
    );
  }
}
