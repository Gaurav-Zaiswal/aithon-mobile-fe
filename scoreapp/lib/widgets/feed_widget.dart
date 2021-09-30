import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:get/get.dart';
// import 'package:scoreapp/controllers/classroom_controller.dart';
import 'package:scoreapp/models/feed_list_model.dart';
// import 'package:scoreapp/models/home_screen_model.dart';

class FeedBox extends StatelessWidget {
  FeedBox({@required this.feed});
  final ClassroomFeedListModel feed;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
    if (feed.feedDescription == null)
      return ListTile(
          // tileColor: Colors.grey[600],
          leading: Icon(Icons.info),
          title: Text(
            "Feed description here",
            style: TextStyle(color: Colors.blue[700]),
          ),
          dense: false,
          subtitle: Row(
            children: [
              Text(
                feed.postedBy.user.firstName,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                feed.postedBy.user.lastName,
              ),
              SizedBox(
                width: 10,
              ),
              Text(dateFormat.format(feed.postedOn)),
            ],
          ));
    else
      return ListTile(
          // tileColor: Colors.grey[600],
          leading: Icon(Icons.info),
          title: Text(
            feed.feedDescription,
            style: TextStyle(color: Colors.blue[700]),
          ),
          dense: false,
          subtitle: Row(
            children: [
              Text(
                feed.postedBy.user.firstName,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                feed.postedBy.user.lastName,
              ),
              SizedBox(
                width: 10,
              ),
              Text(dateFormat.format(feed.postedOn)),
            ],
          ));
  }
}
