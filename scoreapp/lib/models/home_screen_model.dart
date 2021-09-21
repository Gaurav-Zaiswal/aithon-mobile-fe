// To parse this JSON data, do
//
//     final ClassListModel = ClassListModelFromJson(jsonString);

import 'dart:convert';

List<ClassListModel> classListModelFromJson(String str) => List<ClassListModel>.from(json.decode(str).map((x) => ClassListModel.fromJson(x)));

String classListModelToJson(List<ClassListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassListModel {
    ClassListModel({
        this.id,
        this.className,
        this.classDescription,
        this.classCode,
        this.createdBy,
    });

    int id;
    String className;
    String classDescription;
    String classCode;
    CreatedBy createdBy;

    factory ClassListModel.fromJson(Map<String, dynamic> json) => ClassListModel(
        id: json["id"],
        className: json["class_name"],
        classDescription: json["class_description"],
        classCode: json["class_code"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_name": className,
        "class_description": classDescription,
        "class_code": classCode,
        "created_by": createdBy.toJson(),
    };
}

class CreatedBy {
    CreatedBy({
        this.user,
    });

    User user;

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
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
