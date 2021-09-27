// To parse this JSON data, do
//
//     final ClassroomFeedListModel = ClassroomFeedListModelFromJson(jsonString);

import 'dart:convert';

List<ClassroomFeedListModel> classroomFeedListModelFromJson(String str) => List<ClassroomFeedListModel>.from(json.decode(str).map((x) => ClassroomFeedListModel.fromJson(x)));

String classroomFeedListModelToJson(List<ClassroomFeedListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassroomFeedListModel {
    ClassroomFeedListModel({
        this.id,
        this.feedDescription,
        this.postedOn,
        this.classroomId,
        this.assignmentId,
        this.postedBy,
    });

    int id;
    String feedDescription;
    DateTime postedOn;
    int classroomId;
    AssignmentId assignmentId;
    PostedBy postedBy;

    factory ClassroomFeedListModel.fromJson(Map<String, dynamic> json) => ClassroomFeedListModel(
        id: json["id"],
        feedDescription: json["feed_description"] == null ? null : json["feed_description"],
        postedOn: DateTime.parse(json["posted_on"]),
        classroomId: json["classroom_id"],
        assignmentId: AssignmentId.fromJson(json["assignment_id"]),
        postedBy: PostedBy.fromJson(json["posted_by"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "feed_description": feedDescription == null ? null : feedDescription,
        "posted_on": postedOn.toIso8601String(),
        "classroom_id": classroomId,
        "assignment_id": assignmentId.toJson(),
        "posted_by": postedBy.toJson(),
    };
}

class AssignmentId {
    AssignmentId({
        this.title,
        this.description,
        this.points,
        this.creationDate,
        this.deadline,
        this.teacher,
        this.className,
        this.id,
    });

    String title;
    String description;
    int points;
    DateTime creationDate;
    DateTime deadline;
    PostedBy teacher;
    ClassName className;
    int id;

    factory AssignmentId.fromJson(Map<String, dynamic> json) => AssignmentId(
        title: json["title"],
        description: json["description"],
        points: json["points"] == null ? null : json["points"],
        creationDate: json["creation_date"] == null ? null : DateTime.parse(json["creation_date"]),
        deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        teacher: json["teacher"] == null ? null : PostedBy.fromJson(json["teacher"]),
        className: json["class_name"] == null ? null : ClassName.fromJson(json["class_name"]),
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "points": points == null ? null : points,
        "creation_date": creationDate == null ? null : creationDate.toIso8601String(),
        "deadline": deadline == null ? null : deadline.toIso8601String(),
        "teacher": teacher == null ? null : teacher.toJson(),
        "class_name": className == null ? null : className.toJson(),
        "id": id == null ? null : id,
    };
}

class ClassName {
    ClassName({
        this.id,
        this.className,
        this.classDescription,
        this.creationDate,
        this.isClassCodeEnabled,
        this.classCode,
        this.createdBy,
    });

    int id;
    String className;
    String classDescription;
    DateTime creationDate;
    bool isClassCodeEnabled;
    String classCode;
    PostedBy createdBy;

    factory ClassName.fromJson(Map<String, dynamic> json) => ClassName(
        id: json["id"],
        className: json["class_name"],
        classDescription: json["class_description"],
        creationDate: DateTime.parse(json["creation_date"]),
        isClassCodeEnabled: json["is_class_code_enabled"],
        classCode: json["class_code"],
        createdBy: PostedBy.fromJson(json["created_by"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_name": className,
        "class_description": classDescription,
        "creation_date": creationDate.toIso8601String(),
        "is_class_code_enabled": isClassCodeEnabled,
        "class_code": classCode,
        "created_by": createdBy.toJson(),
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
