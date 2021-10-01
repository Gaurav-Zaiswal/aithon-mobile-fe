// To parse this JSON data, do
//
//     final AssignmentListingModel = AssignmentListingModelFromJson(jsonString);

import 'dart:convert';

List<AssignmentListingModel> assignmentListingModelFromJson(String str) => List<AssignmentListingModel>.from(json.decode(str).map((x) => AssignmentListingModel.fromJson(x)));

String assignmentListingModelToJson(List<AssignmentListingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssignmentListingModel {
    AssignmentListingModel({
        this.id,
        this.title,
        this.deadline,
    });

    int id;
    String title;
    DateTime deadline;

    factory AssignmentListingModel.fromJson(Map<String, dynamic> json) => AssignmentListingModel(
        id: json["id"],
        title: json["title"],
        deadline: DateTime.parse(json["deadline"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "deadline": deadline.toIso8601String(),
    };
}
