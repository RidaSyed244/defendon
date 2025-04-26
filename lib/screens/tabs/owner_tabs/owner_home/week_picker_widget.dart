import 'package:defendon/controllers/week_controller.dart';
import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/date_time_extensions.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WeekPickerWidget extends HookWidget {
  const WeekPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WeekController());
    final selectedDate = useState(controller.currentDate.value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.currentDate.value.monthYear,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        10.heightBox,
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              final date = controller.currentWeekDates[index];
              final isSelected = date.day == controller.currentDate.value.day &&
                  date.month == controller.currentDate.value.month &&
                  date.year == controller.currentDate.value.year;

              return InkWell(
                onTap: () {
                  selectedDate.value = date;
                  controller.currentDate.value = date;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? context.primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        DateFormat('E').format(date), // Mon, Tue...
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.primaryLight
                              : context.adaptive45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.heightBox,
                      Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      ],
    );
  }
}
