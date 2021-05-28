import 'package:flutter/material.dart';

TextStyle primary = TextStyle(fontSize: 25);

class CreateClass extends StatefulWidget {
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  String className, description;

  @override
          Widget build(BuildContext context) {
    final classNameField = TextField(
      // grab username from login form
      onChanged: (val) {
        setState(() {
          className = val;
        });
      },
      style: primary,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "Class Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final descriptionField = TextField(
      // grab password from login form
      onChanged: (val) {
        setState(() {
          description = val;
        });
      }, // to hide password
      style: primary,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "Description",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final createClassButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20),
      color: Colors.lightGreen,
      child: MaterialButton(
        minWidth: MediaQuery.of(context)
            .size
            .width, //sets minimum width as of size of screen
        padding: EdgeInsets.all(20),
        onPressed: () {
          print("#################Class Created#################");
        },
        child: Text("Create Class"),
      ),
    );

    return Scaffold(
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
              classNameField,
              SizedBox(
                height: 20,
              ),
              descriptionField,
              SizedBox(
                height: 20,
              ),
              createClassButton,
            ],
          ),
        ),
      ),
    );
  }
}
