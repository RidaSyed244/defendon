import 'package:get/get.dart';

class WeekController extends GetxController {
  final today = DateTime.now();
  final currentDate = DateTime.now().obs;

  List<DateTime> get currentWeekDates {
    final startOfWeek = today.subtract(
      Duration(days: today.weekday - 1),
    );
    return List.generate(
      7,
      (index) => startOfWeek.add(
        Duration(days: index),
      ),
    );
  }
}
