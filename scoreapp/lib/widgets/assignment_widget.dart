import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoreapp/models/assignment_list_view_model.dart';

import 'bottomsheet_to_submit_assignment.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/controllers/classroom_controller.dart';
// import 'package:scoreapp/models/feed_list_model.dart';
// import 'package:scoreapp/models/home_screen_model.dart';

class AssignmentBox extends StatelessWidget {
  AssignmentBox({@required this.assignment});
  final AssignmentListingModel assignment;

  File file;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
    return InkWell(
      // onTap: ()=>{BottomsheetToSubmitAssignment(5)},
      onTap: () => {showBottomSheetToSubmitAssignment(context, assignment.id)},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: ListTile(
            // tileColor: Colors.grey[200],
            leading: Icon(Icons.pending),
            title: Text(
              assignment.title,
              style: TextStyle(color: Colors.blue[700]),
            ),
            dense: false,
            subtitle: Row(
              children: [
                Text("deadline: "),
                SizedBox(
                  width: 5,
                ),
                Text(dateFormat.format(assignment.deadline)),
              ],
            )),
      ),
    );
  }

  showBottomSheetToSubmitAssignment(context, int assignmentId) {
    showBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.grey[400],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                      // key: globalFormKey,
                      child: Column(
                    children: [
                      // SizedBox(
                      //   height: 20,
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
                        // onSaved: (input) =>
                        //     requestModel.title = input,
                        // validator: (input) => input.length == 0
                        //     ? "Title is required"
                        //     : null,
                        decoration: new InputDecoration(
                          hintText:
                              "Ulr of solution file (e.g. google drive link)",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   children: [
                      //     Text("Select File(optional):"),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     // button to choose file
                      //     InkWell(
                      //       onTap: () => chooseFile(),
                      //       child: Container(
                      //         width: MediaQuery.of(context).size.width / 3,
                      //         height: 25,
                      //         decoration: const BoxDecoration(
                      //             // color: Colors.blue,
                      //             ),
                      //         child: const Center(
                      //           child: Text(
                      //             "Choose File",
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w400,
                      //                 fontSize: 15,
                      //                 color: Colors.white),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     // button to upload choosen file
                      //     // InkWell(
                      //     //   onTap: () => uploadFile(),
                      //     //   child: Container(
                      //     //     width: MediaQuery.of(context).size.width,
                      //     //     height: 50,
                      //     //     decoration: const BoxDecoration(
                      //     //       color: Colors.blue,
                      //     //     ),
                      //     //     child: const Center(
                      //     //       child: Text(
                      //     //         "Upload File",
                      //     //         style: TextStyle(
                      //     //             fontWeight: FontWeight.w400,
                      //     //             fontSize: 25,
                      //     //             color: Colors.white),
                      //     //       ),
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),

                      SizedBox(
                        height: 20,
                      ),
                      // assignment weitage field

                      // button
                      Material(
                        elevation: 5.0,
                        // borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[700],
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width /
                              2, //sets minimum width as of size of screen
                          // padding: EdgeInsets.all(20),
                          onPressed: () {
                            // call the api if credential is valid
                            // if (validateAndSave()) {
                            //   apiService
                            //       .createAssignment(requestModel,
                            //           classId, assignmentId)
                              //     .then((value) {
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(SnackBar(
                              //     content: Text(
                              //         "Assignment has been created successfully"),
                              //     dismissDirection:
                              //         DismissDirection.up,
                              //   ));
                              //   // send user to teachers details page
                              //   return Get.toNamed(
                              //       "/class-detail-teacher");
                              // });
                          //   } else {
                          //     throw Exception("Validation Failed.");
                          //   }
                          //   // classCodeController.clear();
                          },
                          child: Text(
                            "Submit Assignment",
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

  bool validateAndSave() {}

  // Future chooseFile() async {
  // }

  // uploadFile() {}
}
