// To parse this JSON data, do
//
//     final AssignmentCreationModel = AssignmentCreationModelFromJson(jsonString);

import 'dart:convert';

AssignmentCreationModel assignmentCreationModelFromJson(String str) => AssignmentCreationModel.fromJson(json.decode(str));

String assignmentCreationModelToJson(AssignmentCreationModel data) => json.encode(data.toJson());

class AssignmentCreationModel {
    AssignmentCreationModel({
        this.title,
        this.description,
        this.points,
        this.deadline,
    });

    String title;
    String description;
    int points;
    
    DateTime deadline;

    factory AssignmentCreationModel.fromJson(Map<String, dynamic> json) => AssignmentCreationModel(
        title: json["title"],
        description: json["description"],
        points: json["points"],
        deadline: DateTime.parse(json["deadline"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "points": points,
        "deadline": deadline.toIso8601String(),
    };
}
