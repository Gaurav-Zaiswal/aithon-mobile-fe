// To parse this JSON data, do
//
//     final SubmittedAssignmentListModel = SubmittedAssignmentListModelFromJson(jsonString);

import 'dart:convert';

List<SubmittedAssignmentListModel> submittedAssignmentListModelFromJson(String str) => List<SubmittedAssignmentListModel>.from(json.decode(str).map((x) => SubmittedAssignmentListModel.fromJson(x)));

String submittedAssignmentListModelToJson(List<SubmittedAssignmentListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubmittedAssignmentListModel {
    SubmittedAssignmentListModel({
        this.student,
        this.assignmentDetails,
        this.assignmentLink,
        this.assignmentAnswer,
    });

    Student student;
    AssignmentDetails assignmentDetails;
    String assignmentLink;
    dynamic assignmentAnswer;

    factory SubmittedAssignmentListModel.fromJson(Map<String, dynamic> json) => SubmittedAssignmentListModel(
        student: Student.fromJson(json["student"]),
        assignmentDetails: AssignmentDetails.fromJson(json["assignment_details"]),
        assignmentLink: json["assignment_link"],
        assignmentAnswer: json["assignment_answer"],
    );

    Map<String, dynamic> toJson() => {
        "student": student.toJson(),
        "assignment_details": assignmentDetails.toJson(),
        "assignment_link": assignmentLink,
        "assignment_answer": assignmentAnswer,
    };
}

class AssignmentDetails {
    AssignmentDetails({
        this.id,
        this.title,
        this.description,
        this.points,
        this.creationDate,
        this.deadline,
        this.teacher,
        this.className,
    });

    int id;
    String title;
    String description;
    int points;
    DateTime creationDate;
    DateTime deadline;
    Student teacher;
    ClassName className;

    factory AssignmentDetails.fromJson(Map<String, dynamic> json) => AssignmentDetails(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        points: json["points"],
        creationDate: DateTime.parse(json["creation_date"]),
        deadline: DateTime.parse(json["deadline"]),
        teacher: Student.fromJson(json["teacher"]),
        className: ClassName.fromJson(json["class_name"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "points": points,
        "creation_date": creationDate.toIso8601String(),
        "deadline": deadline.toIso8601String(),
        "teacher": teacher.toJson(),
        "class_name": className.toJson(),
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
    Student createdBy;

    factory ClassName.fromJson(Map<String, dynamic> json) => ClassName(
        id: json["id"],
        className: json["class_name"],
        classDescription: json["class_description"],
        creationDate: DateTime.parse(json["creation_date"]),
        isClassCodeEnabled: json["is_class_code_enabled"],
        classCode: json["class_code"],
        createdBy: Student.fromJson(json["created_by"]),
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

class Student {
    Student({
        this.user,
    });

    User user;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
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
