import 'dart:convert';

CreateClassroomModel createClassroomModelFromJson(String str) => CreateClassroomModel.fromJson(json.decode(str));

String createClassroomModelToJson(CreateClassroomModel data) => json.encode(data.toJson());

class CreateClassroomModel {
  // controller for creating classroom (must be used by teachers only)
    CreateClassroomModel({
        this.className,
        this.classDescription,
    });

    String className;
    String classDescription;

    factory CreateClassroomModel.fromJson(Map<String, dynamic> json) => CreateClassroomModel(
        className: json["class_name"],
        classDescription: json["class_description"],
    );

    Map<String, dynamic> toJson() => {
        "class_name": className,
        "class_description": classDescription,
    };
}
