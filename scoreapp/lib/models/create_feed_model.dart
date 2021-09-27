// To parse this JSON data, do
//
//     final CreateFeedModel = CreateFeedModelFromJson(jsonString);

import 'dart:convert';

CreateFeedModel createFeedModelFromJson(String str) => CreateFeedModel.fromJson(json.decode(str));

String createFeedModelToJson(CreateFeedModel data) => json.encode(data.toJson());

class CreateFeedModel {
    CreateFeedModel({
        this.id,
        this.feedDescription,
        // this.postedOn,
        this.classroomId,
        this.assignmentId,
        // this.postedBy,
    });

    int id;
    dynamic feedDescription;
    // DateTime postedOn;
    int classroomId;
    dynamic assignmentId;
    // PostedBy postedBy;

    factory CreateFeedModel.fromJson(Map<String, dynamic> json) => CreateFeedModel(
        id: json["id"],
        feedDescription: json["feed_description"],
        // postedOn: DateTime.parse(json["posted_on"]),
        classroomId: json["classroom_id"],
        assignmentId: json["assignment_id"],
        // postedBy: PostedBy.fromJson(json["posted_by"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "feed_description": feedDescription,
        // "posted_on": postedOn.toIso8601String(),
        "classroom_id": classroomId,
        "assignment_id": assignmentId,
        // "posted_by": postedBy.toJson(),
    };
}

class PostedBy {
    PostedBy({
        this.user,
    });

    User user;

    factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class User {
    User({
        this.id,
        this.firstName,
        this.lastName,
        this.isTeacher,
        this.isStudent,
    });

    int id;
    String firstName;
    String lastName;
    bool isTeacher;
    bool isStudent;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isTeacher: json["is_teacher"],
        isStudent: json["is_student"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "is_teacher": isTeacher,
        "is_student": isStudent,
    };
}
