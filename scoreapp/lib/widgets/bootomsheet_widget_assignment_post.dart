import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/models/assignment_creation_model.dart';

class AssignmentFloatingActionButton extends StatefulWidget {
  // const AssignmentFloatingActionButton({ Key? key }) : super(key: key);
  final int classId;
  const AssignmentFloatingActionButton(this.classId);

  @override
  _AssignmentFloatingActionButtonState createState() =>
      _AssignmentFloatingActionButtonState(classId);
}

class _AssignmentFloatingActionButtonState
    extends State<AssignmentFloatingActionButton> {
  int classId;
  _AssignmentFloatingActionButtonState(classId);
  final format = DateFormat("yyyy-MM-dd HH:mm");

  APIService apiService = new APIService();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  TextEditingController classCodeController = TextEditingController();

  AssignmentCreationModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new AssignmentCreationModel();
  }

  @override
  Widget build(BuildContext context) {
    DateTime _now = DateTime.now();

    return FloatingActionButton(
        child: Icon(Icons.assignment),
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (context) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height / 1.7,
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
                                const Text("Create Assignment",
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
                                      requestModel.title = input,
                                  validator: (input) => input.length == 0
                                      ? "Title is required"
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Assignment Title",
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // assignment description field
                                new TextFormField(
                                  // controller: classCodeController,
                                  keyboardType: TextInputType.multiline,
                                  onSaved: (input) =>
                                      requestModel.description = input,
                                  validator: (input) => input.length == 0
                                      ? "Title is required"
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Assignment Description",
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // assignment weitage field
                                new TextFormField(
                                  // controller: classCodeController,
                                  keyboardType: TextInputType.number,
                                  onSaved: (input) =>
                                      requestModel.points = int.parse(input),
                                  validator: _validatePoints,
                                  decoration: new InputDecoration(
                                    hintText: "Weitage",
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // datetime for submission deadline
                                DateTimeField(
                                  format: format,
                                  onSaved: (input) => requestModel.deadline=input,
                                  // validator: validateDeadline,
                                  validator: (input) =>
                                      input.difference(_now).inMinutes < 0
                                          ? "Deadline must be in future"
                                          : null,
                                  resetIcon: Icon(Icons.restore),
                                  decoration: new InputDecoration(
                                    labelText: "Deadline",
                                  ),
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(2021),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            currentValue ?? DateTime.now()),
                                      );
                                      return DateTimeField.combine(date, time);
                                    } else {
                                      return currentValue;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 10,
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
                                      // call the api if credential is valid
                                      if (validateAndSave()) {
                                        apiService
                                            .createAssignment(requestModel,
                                                classId)
                                            .then((value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                "Assignment has been created successfully"),
                                            dismissDirection:
                                                DismissDirection.up,
                                          ));
                                          // send user to teachers details page
                                          return Get.toNamed(
                                              "/class-detail-teacher");
                                        });
                                      } else {
                                        throw Exception("Validation Failed.");
                                      }
                                      classCodeController.clear();
                                    },
                                    child: Text(
                                      "Post Assignment",
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

  String _validatePoints(String input) {
    if (int.parse(input) <= 0)
      return "Points must be greater than zero";
    else
      return null;
  }

  String validateDeadline(DateTime value) {
    DateTime _now = DateTime.now();
    final datetimeDiff = value.difference(_now).inSeconds;
    if (datetimeDiff <= 0) return "Deadline must be in future";
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
