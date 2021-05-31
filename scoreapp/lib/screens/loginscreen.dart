import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:scoreapp/models/login_model.dart';
import 'package:scoreapp/utils/secure_storage.dart';
import 'homescreen.dart';

//setting up some global variables
TextStyle primary = TextStyle(fontSize: 25);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username;
  String password;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;

  LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
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
                              "Login",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(
                              height: 25,
                            ),

                            //emailfield
                            new TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (input) => requestModel.email = input,
                              validator: (input) =>
                                  !input.contains("@") ? "Invalid Email" : null,
                              decoration: new InputDecoration(
                                hintText: "Email Address",
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),

                            // password field
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              // onSaved: ,
                              obscureText: hidePassword,
                              onSaved: (input) => requestModel.password = input,
                              validator: (input) => input.length < 5
                                  ? "Password must be at least 5 characters long"
                                  : null,

                              decoration: new InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    icon: Icon(hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // login button using material
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
                                  // call the ogin api if credential is valid
                                  if (validateAndSave()) {
                                    APIService apiService = new APIService();
                                    apiService
                                        .login(requestModel)
                                        .then((value) {
                                      if (value.token.isNotEmpty) {
                                        // save the token to flutter secure storage
                                        UserSecureStorage.setUserToken(
                                            value.token);
                                        // send user to specific home page based on role
                                        return directToHome();

                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(SnackBar(
                                        //   content:
                                        //       Text(value.token.toString()),
                                        //       // const Text('Login successful'),
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "Check your email and password and try again."),
                                        ));
                                      }
                                    });
                                  } else {
                                    throw Exception("Validation Failed.");
                                  }
                                },
                                child: Text("Log in"),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: <Widget>[
                                Text("New User?"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    // register as teacher button
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, 'register-teacher');
                                      },
                                      child: Text('Register as teacher'),
                                    ),

                                    // register as student button
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/register-student");
                                      },
                                      child: Text('Register as student'),
                                    ),
                                  ],
                                )
                              ],
                            ),
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

  void directToHome() async {
    // read the shared preference to know the user's role
    // and based on role navigate to teacher's or student's homepage
    APIService apiS = new APIService();
    String userToken = await UserSecureStorage.getUserToken();
    apiS.setUserDetails(userToken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isTeacher') == false ||
        prefs.getBool('isStudent') == false) {
      if (prefs.getBool('isTeacher')) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen("Teacher's Homepage")),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen("Student's Homepage")),
            (route) => false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong while navigating to dashboard!"),
      ));
      throw Exception('field value cannot be null.');
    }
  }
}
