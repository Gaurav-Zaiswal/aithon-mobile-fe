import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/controllers/classroom_controller.dart';
import 'package:scoreapp/models/feed_list_model.dart';
// import 'package:scoreapp/models/home_screen_model.dart';

class FeedBox extends StatelessWidget {
  FeedBox({@required this.feed});
  final ClassroomFeedListModel feed; 

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF150259),
        child: Column( 
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.class_)],
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.class_),
              title: Text(
                feed.feedDescription,
                style: TextStyle(color: Colors.white70),
              ),
              dense: false,
              subtitle: Text(
                feed.postedBy.toString(),
              ),
            ),
          ],
        ),    
    );
  }
}
