// new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scoreapp/api/api_service.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scoreapp/models/create_classroom_model.dart';
// import 'package:scoreapp/utils/detail_page_drawer_t.dart';
import 'package:scoreapp/utils/main_drawer_teacher.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:scoreapp/models/login_model.dart';
// import 'package:scoreapp/utils/secure_storage.dart';
// import 'homescreen_t.dart';

//setting up some global variables
TextStyle primary = TextStyle(fontSize: 25);

class CreateClassroom extends StatefulWidget {
  @override
  _CreateClassroomState createState() => _CreateClassroomState();
}

class _CreateClassroomState extends State<CreateClassroom> {
  String className, description;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  APIService apiService = new APIService();

  CreateClassroomModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new CreateClassroomModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a new Classroom"),
      ),
      key: scaffoldKey,
      drawer: MainDrawerTeacher(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                      // color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                        key: globalFormKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 150,
                            ),
                            // Text(
                            //   "Create Classroom",
                            //   style: Theme.of(context).textTheme.headline2,
                            // ),
                            SizedBox(
                              height: 25,
                            ),

                            //classroom name field
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              onSaved: (input) =>
                                  requestModel.className = input,
                              // validator: (input) =>
                              //     !input.contains("@") ? "Invalid Email" : null,
                              decoration: new InputDecoration(
                                hintText: "Class Name",
                                prefixIcon: Icon(Icons.class_),
                              ),
                            ),

                            // classroom description field
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              onSaved: (input) =>
                                  requestModel.classDescription = input,
                              // validator: (input) => input.length < 5
                              //     ? "Password must be at least 5 characters long"
                              //     : null,

                              decoration: new InputDecoration(
                                hintText: "Class Description",
                                prefixIcon: Icon(Icons.description),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // class creation button using material
                            Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen,
                              child: MaterialButton(
                                minWidth: MediaQuery.of(context)
                                    .size
                                    .width, //sets minimum width as of size of screen
                                padding: EdgeInsets.all(20),
                                onPressed: () {
                                  if (validateAndSave()) {
                                    // if valid, send POST request to create the classroom
                                    // if successful then redirect to homescreen
                                    // APIService apiService = new APIService();

                                    apiService
                                        .createClassrooms(requestModel)
                                        .then((value) {
                                      // if value is not empty then redirect to home
                                      if (value.className.isEmpty || value.classDescription.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Some error occured while creating the classroom"),
                                        ));
                                      } else {
                                        // print(requestModel.toJson());
                                        Get.offNamed("/home-teacher");  
                                      }
                                    });
                                  } else {
                                    throw Exception("Validation Failed.");
                                  }
                                },
                                child: Text("Create Classroom"),
                              ),
                            ),
                          ],
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
