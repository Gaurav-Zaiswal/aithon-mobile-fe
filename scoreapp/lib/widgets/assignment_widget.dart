import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoreapp/models/assignment_list_view_model.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/controllers/classroom_controller.dart';
// import 'package:scoreapp/models/feed_list_model.dart';
// import 'package:scoreapp/models/home_screen_model.dart';

class AssignmentBox extends StatelessWidget {
  AssignmentBox({@required this.assignment});
  final AssignmentListingModel assignment;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 20
      ),
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
    );
  }
}
