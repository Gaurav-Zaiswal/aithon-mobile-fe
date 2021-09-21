import 'package:get/state_manager.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/models/home_screen_model.dart';

class ClassroomController extends GetxController {
  var classroomList = List<ClassListModel>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchClassrooms();
    super.onInit();
  }

  // call API to fetch the classrooms of users
  void fetchClassrooms() async {
    isLoading(true);
    try {
      var classrooms = await APIService.getClassrooms();
      if (classrooms != null) {
        classroomList.value = classrooms;
      }
    } finally {
    isLoading(false);
    }
  }
}
