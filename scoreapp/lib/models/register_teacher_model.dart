class RegisterTeacherResponseModel {
  final String token, error;

  RegisterTeacherResponseModel({this.token, this.error});

  factory RegisterTeacherResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterTeacherResponseModel(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
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
