// To parse this JSON data, do
//
//     final AssignmentSubmissionModel = AssignmentSubmissionModelFromJson(jsonString);

import 'dart:convert';

AssignmentSubmissionModel assignmentSubmissionModelFromJson(String str) => AssignmentSubmissionModel.fromJson(json.decode(str));

String assignmentSubmissionModelToJson(AssignmentSubmissionModel data) => json.encode(data.toJson());

class AssignmentSubmissionModel {
  // assignmentDetails is assignment_id -> int type
    AssignmentSubmissionModel({
        this.assignmentLink,
        this.assignmentDetails,
    });

    String assignmentLink;
    int assignmentDetails;  

    factory AssignmentSubmissionModel.fromJson(Map<String, dynamic> json) => AssignmentSubmissionModel(
        assignmentLink: json["assignment_link"],
        // assignmentDetails: json["assignment_details"],
    );

    Map<String, dynamic> toJson() => {
        "assignment_link": assignmentLink,
        "assignment_details": assignmentDetails,
    };
}
