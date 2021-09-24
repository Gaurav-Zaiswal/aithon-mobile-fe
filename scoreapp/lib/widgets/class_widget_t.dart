import 'package:flutter/material.dart';
import 'package:scoreapp/controllers/classroom_controller.dart';
import 'package:scoreapp/models/home_screen_model.dart';

// class ClassBox extends StatefulWidget {
//   // this widget acts as a card for classrooms
//   // primariely used on the homescreen to display list of classrooms

//   final ClassListModel classroomList;
//   ClassBox({this.classroomList});

//   // const ClassBox({ Key? key }) : super(key: key);

//   @override
//   State<ClassBox> createState() => _ClassBoxState(classroomList);
// }

class ClassBox extends StatelessWidget {
  ClassBox({@required this.data});
  ClassListModel data;

  // static ClassListModel classroomList;
  // // final ClassroomController classroomList;
  // static var t = classroomList.className;
  // ClassBox(t);
  // print(classroomList);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[400],
      child: InkWell(
        splashColor: Colors.grey.withAlpha(100),
        onTap: () {
          print('Card tapped.');
        },
        
        
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.class_)
                ],
              ),
              SizedBox(height:10),
              ListTile(
                // leading: Icon(Icons.class_),
                title: Text(
                  data.className,
                  style: TextStyle(color: Colors.white70),
                ),
                dense: false,
                subtitle: Text(
                  data.classDescription,
                ),
              ),
            ],
          
        ),
      ),
    );
  }
}
