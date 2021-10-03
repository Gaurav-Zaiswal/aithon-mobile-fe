import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scoreapp/api/api_service.dart';
// import 'package:scoreapp/models/login_model.dart';
import 'package:scoreapp/models/register_student_model.dart';
import 'package:scoreapp/screens/loginscreen.dart';

// import 'homescreen.dart';

class StudentRegistration extends StatefulWidget {
  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  // String _firstName, _lastName, _username, _email;

  TextEditingController _pwd = TextEditingController();
  TextEditingController _confirmPwd = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _hideCPassword = true;

  RegisterStudentRequestModel requestModel;
  APIService apiService = new APIService();

  @override
  void initState() {
    super.initState();
    requestModel = new RegisterStudentRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                      // color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                        key: globalFormKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 150,
                            ),
                            Text(
                              "Sign Up",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            // full name field
                            // Text("Enter Your Name:"),
                            // first name
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              onSaved: (input) => requestModel.fName = input,
                              // onSaved: (input) => _firstName = input,
                              decoration: new InputDecoration(
                                // border: Border,
                                hintText: "First Name",
                                // prefixIcon: Icon(Icons.email),
                              ),
                              validator: (String input) => input.isEmpty
                                  ? "Please, enter your first name"
                                  : null,
                            ),

                            // last name
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              onSaved: (input) => requestModel.lName = input,
                              // onSaved: (input) => _lastName = input,
                              decoration: new InputDecoration(
                                hintText: "Last Name",
                                // prefixIcon: Icon(Icons.email),
                              ),
                              validator: (String input) => input.isEmpty
                                  ? "Please, enter your last name"
                                  : null,
                            ),

                            // username field
                            new TextFormField(
                                keyboardType: TextInputType.text,
                                onSaved: (input) =>
                                    requestModel.username = input,
                                // onSaved: (input) => _username = input,
                                decoration: new InputDecoration(
                                  hintText: "Username",
                                  // prefixIcon: Icon(Icons.email),
                                ),
                                validator: (input) {
                                  if (!RegExp(r"^\w{2,32}").hasMatch(input)) {
                                    return "only a-z, 0-9, underscore are acceptable ranging 2 to 32 characters";
                                  }
                                  return null;
                                }),

                            //emailfield
                            new TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (input) => requestModel.email = input,
                              // onSaved: (input) => _email = input,
                              validator: (input) =>
                                  !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}")
                                          .hasMatch(input)
                                      ? "Invalid Email"
                                      : null,
                              decoration: new InputDecoration(
                                hintText: "Email Address",
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),

                            // password field
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _pwd,
                              obscureText: _hidePassword,
                              // onSaved not required when controller is used
                              validator: (input) => input.length < 6
                                  ? "Password must be at least 5 characters long"
                                  : null,

                              decoration: new InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    icon: Icon(_hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _hidePassword = !_hidePassword;
                                      });
                                    }),
                              ),
                            ),

                            //confirm password field
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _confirmPwd,
                              // onSaved not required when controller is used ,
                              obscureText: _hideCPassword,
                              validator: (input) {
                                if (_pwd.text != _confirmPwd.text) {
                                  return "Password did not match!";
                                }
                                // since both passwords matched map them to json
                                requestModel.password = _pwd.text;
                                return null;
                              },

                              decoration: new InputDecoration(
                                hintText: "Confirm Password",
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    icon: Icon(_hideCPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _hideCPassword = !_hideCPassword;
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),

                            // signup button using material
                            Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen,
                              child: MaterialButton(
                                minWidth: MediaQuery.of(context)
                                    .size
                                    .width, //sets minimum width as of size of screen
                                padding: EdgeInsets.all(20),
                                onPressed: () {
                                  // call the api if form is valid
                                  if (validateAndSave()) {
                                    print(requestModel.toJson());
                                    // APIService apiService = new APIService();
                                    apiService
                                        .registerStudent(requestModel)
                                        .then((value) {
                                      if (value.token.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(value.token),
                                        ));
                                      } else {
                                        // print(requestModel.toJson());
                                        Navigator.pushNamed(context, "/login");
                                      }
                                    });
                                  } else {
                                    throw Exception(
                                        "client side validation error");
                                  }
                                },
                                child: Text("Sign up"),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              onPressed: () {
                                Get.offAllNamed("/login");
                                // Navigator.pushNamed(context, "/login");
                              },
                              child: Text('Login Here!'),
                            )
                          ],
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
