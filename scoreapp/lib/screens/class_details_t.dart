import 'package:flutter/material.dart';
import 'package:scoreapp/screens/main_drawer_teacher.dart';
import 'dart:ui' as ui;
import 'package:scoreapp/utils/HeaderFooter.dart';
import 'package:scoreapp/widgets/class_widget_t.dart';
import 'create_class.dart';
import 'detail_page_drawer_t.dart';

// classroom detail screen for teacher
class ClassDetailScreenTeacher extends StatefulWidget {
  final String username;
  const ClassDetailScreenTeacher(this.username);

  @override
  _ClassDetailScreenTeacherState createState() =>
      _ClassDetailScreenTeacherState();
}

class _ClassDetailScreenTeacherState extends State<ClassDetailScreenTeacher> {
  final List<Map> myProducts =
      List.generate(100, (index) => {"id": index, "name": "Class $index"})
          .toList();

  String feed;

  @override
  Widget build(BuildContext context) {
    // creating feed field
    final feedField = TextField(
      onChanged: (val) {
        setState(() {
          feed = val;
        });
      },
      style: primary,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "Write something here!",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    // creating button
    final postFeedButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20),
      color: Colors.lightGreen,
      child: MaterialButton(
        minWidth: MediaQuery.of(context)
            .size
            .width, //sets minimum width as of size of screen
        padding: EdgeInsets.all(20),
        onPressed: () {
          print("#################Feed Posted#################");
        },
        child: Text("Post Feed"),
      ),
    );

    Widget buildClasses() => SliverToBoxAdapter(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemCount: 10,
              primary: false,
              shrinkWrap: true,

              // itemBuilder: (BuildContext context, index) => ClassBox(),
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(myProducts[index]["name"]),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                );
              }),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Feed for students')
      ),
      drawer: DetailPageDrawerTeacher(),
      body: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create Class",
              ),
              Icon(Icons.supervised_user_circle_rounded, size: 120),
              SizedBox(
                height: 50,
              ),
              feedField,
              SizedBox(
                height: 20,
              ),
              postFeedButton,
            ],
          ),
        ),
      ),
    );
  }
}
