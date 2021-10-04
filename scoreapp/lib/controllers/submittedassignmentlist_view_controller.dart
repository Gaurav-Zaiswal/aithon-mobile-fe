import 'package:get/state_manager.dart';
import 'package:scoreapp/api/api_service.dart';
// import 'package:scoreapp/models/SubmittedAssignment_list_model.dart';
// import 'package:scoreapp/models/home_screen_model.dart';
import 'package:scoreapp/models/submitted_assignment_list_model.dart';

class SubmittedAssignmentListController extends GetxController {
  int classId;
  SubmittedAssignmentListController(this.classId);
  // Controller for fetching the specific classroom in which
  //  the currently user is enrolled/ or created

  var submittedAssignmentList = List<SubmittedAssignmentListModel>().obs;
  var isLoading = true.obs; // to show circular loading moving icon

  @override
  void onInit() {
    fetchSubmittedAssignments();
    super.onInit();
  }

  // call API to fetch the classrooms of users
  void fetchSubmittedAssignments() async {
    // controller to fetch the list of created/enrolled classrooms (for both teacher and student)

    isLoading(true);
    try {
      var submittedAssignments = await APIService.getSubmittedAssignments(classId);
      if (submittedAssignments != null) {
        for (int i = 0; i < submittedAssignments.length; i++) {
          submittedAssignmentList.add(submittedAssignments[i]);
        }
        // SubmittedAssignmentList.value = SubmittedAssignments;
      }
    } finally {
      isLoading(false);
    }
  }
}
