import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarController extends GetxController {
  final searchQuery = ''.obs;
  final TextEditingController textController = TextEditingController();

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void clearSearch() {
    textController.clear();
    searchQuery.value = '';
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
