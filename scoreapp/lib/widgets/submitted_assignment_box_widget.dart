import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/controllers/classroom_controller.dart';
// import 'package:scoreapp/models/feed_list_model.dart';
import 'package:scoreapp/models/submitted_assignment_list_model.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:scoreapp/models/home_screen_model.dart';

class AssignmentSolutionBox extends StatefulWidget {
  AssignmentSolutionBox({@required this.submittedAssignment});
  final SubmittedAssignmentListModel submittedAssignment;

  @override
  State<AssignmentSolutionBox> createState() => _AssignmentSolutionBoxState();
}

class _AssignmentSolutionBoxState extends State<AssignmentSolutionBox> {
  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    if (widget.submittedAssignment.assignmentLink == null)
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
                widget.submittedAssignment.student.user.firstName,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.submittedAssignment.student.user.lastName,
              ),
              SizedBox(
                width: 10,
              ),
              Text(dateFormat.format(
                  widget.submittedAssignment.assignmentDetails.creationDate)),
            ],
          ));
    else
      // >>>>>>>>>>>>>>>>>>>>>> old list tile for showing assignment submission details stats
      // return ListTile(
      //     // tileColor: Colors.grey[300],
      //     leading: Icon(Icons.link_rounded),
      //     // trailing: Icon(Icons.arrow_right),
      //     title: Text(
      //       widget.submittedAssignment.assignmentDetails.title,
      //       style: TextStyle(color: Colors.black87),
      //     ),
      //     dense: false,

      //   );
      // >>>>>>>>>>>>>>>>>>>>>> old list tile for showing assignment submission details ends

      // >>>>>>>>>>>>>>>>>>>>>> New: Card for showing assignment submission details stats

      return Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.title),
                title: Text(widget.submittedAssignment.assignmentDetails.title),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.link),
                      SizedBox(width: 5,),
                      Text(
                        "File link:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(widget.submittedAssignment.assignmentLink),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end, 
                    children: [
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _launchInBrowser(
                            widget.submittedAssignment.assignmentLink);
                      }),
                      child: const Text("Open in browser"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _launchInWebViewOrVC(
                            widget.submittedAssignment.assignmentLink);
                      }),
                      child: const Text("Open in App"),
                    )
                  ])
                ],
              ),
            ],
          ),
        ),
      );
    // >>>>>>>>>>>>>>>>>>>>>> New: Card for showing assignment submission details endss
  }
}
