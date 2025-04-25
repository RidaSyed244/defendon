import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

class SetAvailabilityScreen extends HookWidget {
  const SetAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedDay = useState(DateTime.now());
    final selectedDay = useState(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: focusedDay.value,
              selectedDayPredicate: (day) => isSameDay(
                selectedDay.value,
                day,
              ),
              onDaySelected: (selDay, focDay) {
                selectedDay.value = selDay;
                focusedDay.value = focDay;
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                leftChevronIcon: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
                rightChevronIcon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                selectedDecoration: BoxDecoration(
                  color: context.primaryColor,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: const TextStyle(color: Colors.black87),
                defaultTextStyle: const TextStyle(color: Colors.black87),
                selectedTextStyle: const TextStyle(color: Colors.white),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(
                  color: context.adaptive,
                ),
                weekdayStyle: TextStyle(
                  color: context.adaptive,
                ),
              ),
            ),
          ),
        ],
      ).p16().safeArea(),
      bottomNavigationBar: PrimaryButton(
        text: 'Next',
        textColor: Colors.white,
        onTap: () {},
      ).p16().safeArea(),
    );
  }
}
