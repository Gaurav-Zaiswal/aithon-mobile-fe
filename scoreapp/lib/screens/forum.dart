import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  // const Forum({ Key? key }) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forum")),
      body: Center(
        child: Text("This is Forum Screen"),
      ),
    );
  }
}
