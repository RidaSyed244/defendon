import 'package:get/get.dart';

class TabsController extends GetxController {
  var currentIndex = 0.obs;
  var showMyTeams = false.obs;
  var imageUrl = ''.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  // Optional: Load user info from your model
  void updateUser({required bool showTeams, required String url}) {
    showMyTeams.value = showTeams;
    imageUrl.value = url;
  }
}
