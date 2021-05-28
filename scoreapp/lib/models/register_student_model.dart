class RegisterStudentResponseModel {
  final String token, error;

  RegisterStudentResponseModel({this.token, this.error});

  factory RegisterStudentResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterStudentResponseModel(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
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
