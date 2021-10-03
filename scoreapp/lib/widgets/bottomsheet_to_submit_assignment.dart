// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:scoreapp/api/api_service.dart';
// import 'package:scoreapp/models/assignment_creation_model.dart';
// import 'package:scoreapp/models/assignment_submission_model.dart';

// class BottomsheetToSubmitAssignment extends StatefulWidget {
//   final int classId, assignmentId;
//   const BottomsheetToSubmitAssignment(
//       {@required this.classId, @required this.assignmentId});
//   // const BottomsheetToSubmitAssignment(this.classId);

//   @override
//   _BottomsheetToSubmitAssignmentState createState() =>
//       _BottomsheetToSubmitAssignmentState(
//           classroomId: classId, assignmentDetail: assignmentId);
// }

// class _BottomsheetToSubmitAssignmentState
//     extends State<BottomsheetToSubmitAssignment> {
//   int classroomId, assignmentDetail;
//   _BottomsheetToSubmitAssignmentState(
//       {this.classroomId, this.assignmentDetail});
//   // final format = DateFormat("yyyy-MM-dd HH:mm");

//   APIService apiService = new APIService();
//   GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
//   TextEditingController urlController = TextEditingController();

//   AssignmentSubmissionModel requestModel;

//   @override
//   void initState() {
//     super.initState();
//     requestModel = new AssignmentSubmissionModel();
//     requestModel.assignmentDetails = assignmentDetail;
//     // jugadu upaay for file upload -> provide a default file
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     // DateTime _now = DateTime.now();

//     return FloatingActionButton(
//       child: Text("Make Submission"),
//       onPressed: () {
//       showBottomSheet(
//           context: context,
//           builder: (context) => Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 height: MediaQuery.of(context).size.height / 1.7,
//                 color: Colors.grey[400],
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Form(
//                         key: globalFormKey,
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 25,
//                             ),
//                             const Text("Submit Assignment",
//                                 style: TextStyle(
//                                   color: Colors.white70,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 25,
//                                 )),
//                             SizedBox(
//                               height: 25,
//                             ),
//                             // assignment title field
//                             new TextFormField(
//                               // controller: classCodeController,
//                               onSaved: (input) =>
//                                   requestModel.assignmentLink = input,
//                               validator: (input) => input.length == 0
//                                   ? "you must provide url"
//                                   : null,
//                               decoration: new InputDecoration(
//                                 hintText: "Assignment solution file link (e.g. google drive",
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),

//                             // assignment weitage field

//                             // button
//                             Material(
//                               elevation: 5.0,
//                               // borderRadius: BorderRadius.circular(20),
//                               color: Colors.blue[700],
//                               child: MaterialButton(
//                                 minWidth: MediaQuery.of(context).size.width /
//                                     2, //sets minimum width as of size of screen
//                                 // padding: EdgeInsets.all(20),
//                                 onPressed: () {
//                                   // call the api if credential is valid
//                                   if (validateAndSave()) {
//                                     apiService
//                                         .submitAssignment(
//                                             requestModel, classroomId)
//                                         .then((value) {
//                                       urlController.clear();
//                                       Get.offNamed("/class-detail-student");
//                                     });
//                                   } else {
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(SnackBar(
//                                       content: Text(
//                                           "Could not submit the assignment"),
//                                       dismissDirection: DismissDirection.up,
//                                     ));
//                                     throw Exception("Validation Failed.");
//                                   }
//                                   urlController.clear();
//                                 },
//                                 child: Text(
//                                   "Submit Assignment",
//                                   style: TextStyle(color: Colors.white70),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ))
//                   ],
//                 ),
//               ));
//     });
//   }

//   String _validatePoints(String input) {
//     if (int.parse(input) <= 0)
//       return "Points must be greater than zero";
//     else
//       return null;
//   }

//   String validateDeadline(DateTime value) {
//     DateTime _now = DateTime.now();
//     final datetimeDiff = value.difference(_now).inSeconds;
//     if (datetimeDiff <= 0) return "Deadline must be in future";
//   }

//   bool validateAndSave() {
//     final form = globalFormKey.currentState;
//     if (form.validate()) {
//       form.save();
//       return true;
//     } else
//       return false;
//   }
// }
