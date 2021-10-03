class RegisterTeacherResponseModel {
  final String username, email, firstName, lastName;

  RegisterTeacherResponseModel(
      {this.username, this.email, this.firstName, this.lastName});

  factory RegisterTeacherResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterTeacherResponseModel(
        username: json["username"] != null ? json["username"] : "",
        email: json["email"] != null ? json["email"] : "",
        firstName: json["first_name"] != null ? json["first_name"] : "",
        lastName: json["last_name"] != null ? json["last_name"] : "");
  }
}

class RegisterTeacherRequestModel {
  String fName, lName, username, email, password;

  RegisterTeacherRequestModel(
      {this.fName, this.lName, this.username, this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> credentialMap = {
      'first_name': fName.trim(),
      'last_name': lName.trim(),
      'username': username.trim(),
      'email': email.trim(),
      'password': password.trim()
    };

    return credentialMap;
  }
}
