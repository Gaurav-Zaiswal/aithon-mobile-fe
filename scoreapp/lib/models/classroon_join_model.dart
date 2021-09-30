// To parse this JSON data, do
//
//     final ClassroomJoinModel = ClassroomJoinModelFromJson(jsonString);

import 'dart:convert';

ClassroomJoinModel classroomJoinModelFromJson(String str) => ClassroomJoinModel.fromJson(json.decode(str));

String classroomJoinModelToJson(ClassroomJoinModel data) => json.encode(data.toJson());

class ClassroomJoinModel {
    ClassroomJoinModel({
        this.classCode,
    });

    String classCode;

    factory ClassroomJoinModel.fromJson(Map<String, dynamic> json) => ClassroomJoinModel(
        classCode: json["class_code"],
    );

    Map<String, dynamic> toJson() => {
        "class_code": classCode,
    };
}
