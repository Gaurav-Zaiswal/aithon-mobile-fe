class UserResponseModel {
  final int id;
  final String firstName, lastName;
  final bool isStudent, isTeacher;

  UserResponseModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.isStudent,
      this.isTeacher});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      isStudent: json["is_student"],
      isTeacher: json["is_teacher"],
    );
  }
}
