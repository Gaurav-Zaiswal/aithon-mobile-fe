class UserResponseModel {
  final String id;
  final String username, email, firstName, lastName;
  final bool isStudent, isTeacher;

  UserResponseModel(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.isStudent,
      this.isTeacher});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json["id"] != null ? json["id"] : "",
      username: json["username"] != null ? json["username"] : "",
      email: json["email"] != null ? json["email"] : "",
      firstName: json["first_name"] != null ? json["first_name"] : "",
      lastName: json["last_name"] != null ? json["last_name"] : "",
      isStudent: json["is_student"],
      isTeacher: json["is_teacher"],
    );
  }
}

// class UserRequestModel {
//   String email, password;

//   UserRequestModel({this.email, this.password});

//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> credentialMap = {
//       'username': email.trim(),
//       'password': password.trim()
//     };

//     return credentialMap;
//   }
// }
