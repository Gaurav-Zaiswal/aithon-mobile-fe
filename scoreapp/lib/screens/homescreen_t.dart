import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/controllers/classroom_controller.dart';
import 'package:scoreapp/screens/main_drawer_teacher.dart';
import 'dart:ui' as ui;
import 'package:scoreapp/utils/HeaderFooter.dart';
import 'package:scoreapp/widgets/class_widget_t.dart';
import 'createclass.dart';

// homepage for teacher
class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen(this.username);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // instantiating classroom controller
  final ClassroomController classroomController =
      Get.put(ClassroomController());

  // final List<Map> myProducts =
  //     List.generate(100, (index) => {"id": index, "name": "Class OOSD"})
  //         .toList();

  @override
  Widget build(BuildContext context) {
    Widget buildClasses() => SliverToBoxAdapter(child: Obx(
          () {
            if (classroomController.isLoading.value) 
              return Center(child: CircularProgressIndicator());
            else
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    // crossAxisSpacing: 5,
                    // mainAxisSpacing: 20
                    ),
                itemCount: classroomController.classroomList.length,
                primary: false,
                shrinkWrap: true,

                // itemBuilder: (BuildContext context, index) => ClassBox(),
                // itemBuilder: (BuildContext ctx, index) {
                //   return Container(
                //     alignment: Alignment.center,
                //     // height: 20,
                //     padding: EdgeInsets.only(left: 10, right: 10),
                //     child: Text(myProducts[index]["name"]),
                //     decoration: BoxDecoration(
                //         color: Colors.amber,
                //         borderRadius: BorderRadius.circular(15)),
                //   );
                // }),

                itemBuilder: (BuildContext ctx, index) {
                  return ClassBox(classroomController.classroomList[index]);
                });
          },
        ));

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Class Joined'),
      // ),
      drawer: MainDrawerTeacher(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Joined Classes'),
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 200,
            floating: true,
            stretch: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.unsplash.com/photo-1509062522246-3755977927d7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1104&q=80',
                fit: BoxFit.cover,
              ),
            stretchModes:  [
              StretchMode.fadeTitle,
            ],
              centerTitle: true,
            ),
          ),

          // add classes grid here
          buildClasses(),
        ],
      ),
    );
  }
}
