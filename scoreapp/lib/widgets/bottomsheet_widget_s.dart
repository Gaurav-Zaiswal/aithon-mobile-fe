import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/models/classroon_join_model.dart';
// import 'package:scoreapp/utils/secure_storage.dart';

class MyFloatingActionButton extends StatefulWidget {
  // const FloatingActionButton({ Key? key }) : super(key: key);

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  APIService apiService = new APIService();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  TextEditingController classCodeController = TextEditingController();

  ClassroomJoinModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new ClassroomJoinModel();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (context) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 300,
                    color: Colors.grey[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                            key: globalFormKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                const Text(
                                    "Enter the code to join the classroom"),
                                SizedBox(
                                  height: 25,
                                ),
                                // passcode field
                                new TextFormField(
                                  controller: classCodeController,
                                  onSaved: (input) =>
                                      requestModel.classCode = input,
                                  validator: (input) => input.length != 8
                                      ? "Code must be 8 characters long."
                                      : null,
                                  decoration: new InputDecoration(
                                      prefixIcon: Icon(Icons.vpn_key)),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                // button
                                Material(
                                  elevation: 5.0,
                                  // borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue[700],
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context)
                                            .size
                                            .width /
                                        2, //sets minimum width as of size of screen
                                    // padding: EdgeInsets.all(20),
                                    onPressed: () {
                                      // call the ogin api if credential is valid
                                      if (validateAndSave()) {
                                        apiService
                                            .joinClassroom(requestModel)
                                            .then((value) {
                                          classCodeController.clear();
                                          Get.offAllNamed("/home-student");
                                          // return directToHome();
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                "Some error occured while trying to join the classroom"),
                                            dismissDirection:
                                                DismissDirection.up,
                                          ));
                                          // // send user to specific home page based on role
                                        throw Exception("Validation Failed.");
                                      }
                                    },
                                    child: Text(
                                      "Join Classroom",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ));
        });
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

  // directToHome() {
  //   Get.offAll("/home-student");
  // }
}
