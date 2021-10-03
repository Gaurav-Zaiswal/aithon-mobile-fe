class RegisterStudentResponseModel {
  final String username, email, firstName, lastName;

  RegisterStudentResponseModel({this.username, this.email, this.firstName, this.lastName});

  factory RegisterStudentResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterStudentResponseModel(
        username: json["username"] != null ? json["username"] : "",
        email: json["email"] != null ? json["email"] : "",
        firstName: json["first_name"] != null ? json["first_name"] : "",
        lastName: json["last_name"] != null ? json["last_name"] : "");
  }
}

class RegisterStudentRequestModel {
  String fName, lName, username, email, password;

  RegisterStudentRequestModel(
      {this.fName, this.lName, this.username, this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> credentialMap = {
      'first_name': fName.trim(),
      'last_name': lName.trim(),
      'username': username.trim(),
      'email': email.trim(),
      'password': password.trim(),
    };

    return credentialMap;
  }
}
