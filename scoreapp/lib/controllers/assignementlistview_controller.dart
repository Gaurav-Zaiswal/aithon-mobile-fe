import 'package:get/state_manager.dart';
import 'package:scoreapp/api/api_service.dart';
import 'package:scoreapp/models/assignment_list_view_model.dart';
import 'package:scoreapp/models/feed_list_model.dart';
import 'package:scoreapp/models/home_screen_model.dart';

class AssignmentListController extends GetxController {
  int classId;
  AssignmentListController(this.classId);
  // Controller for fetching the specific classroom in which
  //  the currently user is enrolled/ or created

  var assignmentList = List<AssignmentListingModel>().obs;
  var isLoading = true.obs; // to show circular loading moving icon

  @override
  void onInit() {
    fetchAssignments();
    super.onInit();
  }

  // call API to fetch the classrooms of users
  void fetchAssignments() async {
    // controller to fetch the list of created/enrolled classrooms (for both teacher and student)

    isLoading(true);
    try {
      var assignments = await APIService.getAssignmentsList(classId.toString());
      if (assignments != null) {
        for (int i = 0; i < assignments.length; i++) {
          assignmentList.add(assignments[i]);
        }
        // AssignmentList.value = assignments;
      }
    } finally {
      isLoading(false);
    }
  }
}
