import 'package:flutter/material.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/models/create_feed_model.dart';

import 'package:get/get.dart';
// import 'package:scoreapp/utils/secure_storage.dart';

class TextFieldForFeed extends StatefulWidget {
  final int classRoomId;
  TextFieldForFeed({@required this.classRoomId});

  @override
  _TextFieldForFeedState createState() => _TextFieldForFeedState(classRoomId);
}

class _TextFieldForFeedState extends State<TextFieldForFeed> {
  final int classRoomId;
  _TextFieldForFeedState(this.classRoomId);
  String feed;

  APIService apiService = new APIService();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  TextEditingController feedEditingController = TextEditingController();
  CreateFeedModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new CreateFeedModel();
  }

  @override
  Widget build(BuildContext context) {
    // creating button
    final postFeedButton = Material(
      elevation: 5.0,
      // borderRadius: BorderRadius.circular(20),
      color: Colors.blue[400],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        //sets minimum width as of size of screen
        padding: EdgeInsets.all(20),
        onPressed: () {
          // call the ogin api if credential is valid
          if (validateAndSave()) {
            apiService
                .postFeed(requestModel, classRoomId.toString())
                .then((value) {
              // if feed is created successfully then reload the page
              // check if feed has been created, here id is of feed's id
              // so if feed has been created then id must not be null

              if (value.id != null) {
                // print("#################Feed Posted#################");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Feed has been posted to classroom!"),
                  dismissDirection: DismissDirection.up,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Feed field cannot be empty"),
                ));
              }
            });
          } else {
            throw Exception("Validation Failed.");
          }
          feedEditingController.clear();
        },
        child: Text(
          "Post Feed",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: globalFormKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // Text("Post feed for classroom!",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
              // ),
              TextFormField(
                controller: feedEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onSaved: (input) {
                  requestModel.feedDescription = input;
                  requestModel.classroomId = classRoomId;
                },
                validator: (input) =>
                    input == "" ? "Feed field must be filled" : null,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Post feed to classroom",
                    border: UnderlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              postFeedButton,
            ],
          ),
        ));
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
