import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  // const Library({ Key? key }) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Library")),
      body: Center(
        child: Text("This is Library Screen"),
      ),
    );
  }
}
