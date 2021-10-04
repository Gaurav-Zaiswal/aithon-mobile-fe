import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/controllers/classroom_controller.dart';
// import 'package:scoreapp/models/feed_list_model.dart';
import 'package:scoreapp/models/submitted_assignment_list_model.dart';
// import 'package:scoreapp/models/home_screen_model.dart';

class AssignmentSolutionBox extends StatelessWidget {
  AssignmentSolutionBox({@required this.submittedAssignment});
  final SubmittedAssignmentListModel submittedAssignment;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    if (submittedAssignment.assignmentLink == null)
      return ListTile(
          tileColor: Colors.grey[600],
          leading: Icon(Icons.info),
          title: Text(
            "Description of solution here",
            style: TextStyle(color: Colors.blue[700]),
          ),
          dense: false,
          subtitle: Row(
            children: [

              Text(
                submittedAssignment.student.user.firstName,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                submittedAssignment.student.user.lastName,
              ),
              SizedBox(
                width: 10,
              ),
              Text(dateFormat.format(submittedAssignment.assignmentDetails.creationDate)),
            ],
          ));
    else
      return ListTile(
          tileColor: Colors.grey[300],
          leading: Icon(Icons.link_rounded),
          trailing: Icon(Icons.arrow_right),
          title: Text(
            submittedAssignment.assignmentDetails.title,
            style: TextStyle(color: Colors.blue[700]),
          ),
          dense: false,
          subtitle: Row(
            children: [
              Text(
               submittedAssignment.student.user.firstName,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
               submittedAssignment.student.user.lastName,
              ),
              SizedBox(
                width: 10,
              ),
              Text(dateFormat.format(submittedAssignment.assignmentDetails.creationDate)),
            ],
          ));
  }
}
