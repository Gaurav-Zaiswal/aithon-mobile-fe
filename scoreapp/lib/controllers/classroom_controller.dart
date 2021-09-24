import 'package:get/state_manager.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/models/home_screen_model.dart';

class ClassroomController extends GetxController {
  // Controller for fetching the specific classroom in which
  //  the currently user is enrolled/ or created

  var classroomList = List<ClassListModel>().obs;
  var isLoading = true.obs; // to show circular loading moving icon

  @override
  void onInit() {
    fetchClassrooms();
    super.onInit();
  }

  // call API to fetch the classrooms of users
  void fetchClassrooms() async {
    // controller to fetch the list of created/enrolled classrooms (for both teacher and student)

    isLoading(true);
    try {
      var classrooms = await APIService.getClassrooms();
      if (classrooms != null) {
        for (int i = 0; i < classrooms.length; i++) {
          classroomList.add(classrooms[i]);
        }
        // classroomList.value = classrooms;
      }
    } finally {
      isLoading(false);
    }
  }
}
