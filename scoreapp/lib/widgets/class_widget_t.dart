import 'package:flutter/material.dart';
import 'package:scoreapp/models/home_screen_model.dart';

// class ClassBox extends StatelessWidget {
//   // const ClassBox({ Key? key }) : super(key: key);

//   final List<Map> myProducts =
//       List.generate(100000, (index) => {"id": index, "name": "Product $index"})
//           .toList();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Text(myProducts[index]["name"]),
//       decoration: BoxDecoration(
//           color: Colors.amber, borderRadius: BorderRadius.circular(15)),
//     );
//   }
// }

class ClassBox extends StatefulWidget {
  // this widget acts as a card for classrooms
  // primariely used on the homescreen to display list of classrooms

  final ClassListModel classroomList;
  ClassBox(this.classroomList);

  // const ClassBox({ Key? key }) : super(key: key);

  @override
  State<ClassBox> createState() => _ClassBoxState();
}

class _ClassBoxState extends State<ClassBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Java Programming'),
              subtitle:
                  Text('this is a java class. Please have fun. Thank you!'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Enter into Classroom'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                // TextButton(
                //   child: const Text('LISTEN'),
                //   onPressed: () {/* ... */},
                // ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
