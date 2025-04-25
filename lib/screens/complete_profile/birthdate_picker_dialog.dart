import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BirthDatePickerDialog extends StatefulWidget {
  final Function(String month, String day, String year) onDateSelected;

  const BirthDatePickerDialog({
    super.key,
    required this.onDateSelected,
  });

  @override
  State<BirthDatePickerDialog> createState() => _BirthDatePickerDialogState();
}

class _BirthDatePickerDialogState extends State<BirthDatePickerDialog> {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<String> days =
      List.generate(31, (index) => (index + 1).toString());
  final List<String> years = List.generate(
    100,
    (index) => (DateTime.now().year - index).toString(),
  );

  late FixedExtentScrollController monthController;
  late FixedExtentScrollController dayController;
  late FixedExtentScrollController yearController;

  late int selectedMonthIndex;
  late int selectedDayIndex;
  late int selectedYearIndex;

  @override
  void initState() {
    super.initState();

    // Set default values
    selectedMonthIndex = DateTime.now().month - 1;
    selectedDayIndex = DateTime.now().day - 1;
    selectedYearIndex = 0; // Current year

    // Initialize controllers
    monthController =
        FixedExtentScrollController(initialItem: selectedMonthIndex);
    dayController = FixedExtentScrollController(initialItem: selectedDayIndex);
    yearController =
        FixedExtentScrollController(initialItem: selectedYearIndex);
  }

  @override
  void dispose() {
    monthController.dispose();
    dayController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose Date of Birth',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: context.adaptive,
            ),
          ).pOnly(
            top: 8,
            bottom: 12,
          ),
          SizedBox(
            height: 220,
            child: Row(
              children: [
                Expanded(
                  child: _buildWheelPicker(
                    monthController,
                    months,
                    (index) {
                      setState(() {
                        selectedMonthIndex = index;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: _buildWheelPicker(
                    dayController,
                    days,
                    (index) {
                      setState(() {
                        selectedDayIndex = index;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: _buildWheelPicker(
                    yearController,
                    years,
                    (index) {
                      setState(() {
                        selectedYearIndex = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PrimaryButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  isOutline: true,
                  borderRadius: 12,
                  text: 'Cancel',
                  textColor: context.primaryColor,
                ),
              ),
              16.widthBox,
              Expanded(
                child: PrimaryButton(
                  onTap: () {
                    widget.onDateSelected(
                      months[selectedMonthIndex],
                      days[selectedDayIndex],
                      years[selectedYearIndex],
                    );
                    Navigator.of(context).pop();
                  },
                  borderRadius: 12,
                  text: 'Okay',
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ).p16(),
    );
  }

  Widget _buildWheelPicker(
    FixedExtentScrollController controller,
    List<String> items,
    Function(int) onItemSelected,
  ) {
    return ListWheelScrollView.useDelegate(
      controller: controller,
      itemExtent: 40, // Height of each item
      perspective: 0.005, // Makes it look more like a wheel
      diameterRatio: 1.5, // Adjusts curvature
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: onItemSelected,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: items.length,
        builder: (context, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              items[index],
              style: TextStyle(
                fontSize: controller.selectedItem == index ? 22 : 20,
                fontWeight: controller.selectedItem == index
                    ? FontWeight.w500
                    : FontWeight.normal,
                color: controller.selectedItem == index
                    ? Colors.black
                    : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
