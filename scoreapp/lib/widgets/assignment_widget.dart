import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/models/assignment_list_view_model.dart';
import 'package:scoreapp/models/assignment_submission_model.dart';

import 'bottomsheet_to_submit_assignment.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/controllers/classroom_controller.dart';
// import 'package:scoreapp/models/feed_list_model.dart';
// import 'package:scoreapp/models/home_screen_model.dart';

class AssignmentBox extends StatefulWidget {
  final AssignmentListingModel assignment;
  final int classId;
  AssignmentBox({@required this.assignment, @required this.classId});

  @override
  State<AssignmentBox> createState() => _AssignmentBoxState(
      classroomId: classId, assignmentDetail: assignment.id);
}

class _AssignmentBoxState extends State<AssignmentBox> {
  File file;
  final int classroomId, assignmentDetail;
  _AssignmentBoxState({this.classroomId, this.assignmentDetail});

  APIService apiService = new APIService();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  TextEditingController urlController = TextEditingController();

  AssignmentSubmissionModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new AssignmentSubmissionModel();
    requestModel.assignmentDetails = this.assignmentDetail;
    // jugadu upaay for file upload -> provide a default file
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
    return InkWell(
      // onTap: ()=>{BottomsheetToSubmitAssignment(5)},
      onTap: () => {showBottomSheetToSubmitAssignment(context)},
      // onTap: () => {
      //   // print("34567890"),
      //   BottomsheetToSubmitAssignment(
      //       assignmentId: assignment.id, classId: classId)
      // },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: ListTile(
            // tileColor: Colors.grey[200],
            leading: Icon(Icons.pending),
            title: Text(
              widget.assignment.title,
              style: TextStyle(color: Colors.blue[700]),
            ),
            dense: false,
            subtitle: Row(
              children: [
                Text("deadline: "),
                SizedBox(
                  width: 5,
                ),
                Text(dateFormat.format(widget.assignment.deadline)),
              ],
            )),
      ),
    );
  }

  showBottomSheetToSubmitAssignment(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height / 2.5,
              color: Colors.grey[400],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                      key: globalFormKey,
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: 25,
                          // ),
                          const Text("Submit Assignment",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              )),
                          SizedBox(
                            height: 25,
                          ),
                          // assignment title field
                          new TextFormField(
                            // controller: classCodeController,
                            onSaved: (input) =>
                                requestModel.assignmentLink = input,
                            validator: (input) => input.length == 0
                                ? "you must provide url"
                                : null,
                            decoration: new InputDecoration(
                              hintText:
                                  "Assignment solution file link (e.g. google drive",
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          // assignment weitage field

                          // button
                          Material(
                            elevation: 5.0,
                            // borderRadius: BorderRadius.circular(20),
                            color: Colors.blue[700],
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              //sets minimum width as of size of screen
                              // padding: EdgeInsets.all(20),
                              onPressed: () {
                                // call the api if credential is valid
                                if (validateAndSave()) {
                                  // print(
                                  //     "request mode -------------> ${requestModel.assignmentDetails}");
                                  apiService
                                      .submitAssignment(
                                          requestModel, classroomId)
                                      .then((value) {
                                    urlController.clear();
                                    Get.offNamed("/class-detail-student");
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text("Could not submit the assignment"),
                                    dismissDirection: DismissDirection.up,
                                  ));
                                  throw Exception("Validation Failed.");
                                }
                                urlController.clear();
                              },
                              child: Text(
                                "make submission",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }
}
