import 'package:defendon/screens/tabs/user_tabs/user_profile/user_profile_deatils_screen.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:flutter/material.dart';

class CalendarTimeSelection extends StatefulWidget {
  const CalendarTimeSelection({super.key});

  @override
  State<CalendarTimeSelection> createState() => _CalendarTimeSelectionState();
}

class _CalendarTimeSelectionState extends State<CalendarTimeSelection> {
  int fromHour = 4;
  int fromMinute = 20;
  bool fromIsAm = true;

  int toHour = 5;
  int toMinute = 20;
  bool toIsAm = false;

  String selectedLocation = "Helden st";
  String selectedState = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
        ),
      ),
      body: Column(
        children: [
          PrimaryOutlinedCard(
            backgroundColor: Colors.white10,
            borderRadius: 16,
            child: Column(
              children: [
                Row(
                  children: [
                    PrimaryOutlinedCard(
                      backgroundColor: Colors.white,
                      borderRadius: 14,
                      padding: EdgeInsets.zero,
                      child: IconButton(
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Select Time",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          40.heightBox,
          Row(
            children: [
              const Text(
                "From",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              16.widthBox,
              Expanded(
                child: _SelectedTimeWidget(
                  time: fromHour,
                ),
              ),
              8.widthBox,
              Expanded(
                child: _SelectedTimeWidget(
                  time: fromMinute,
                ),
              ),
              8.widthBox,
              _SelectedTimeWidget(
                time: fromIsAm ? "AM" : "PM",
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ).pSymmetric(h: 16),
          10.heightBox,
          Row(
            children: [
              const SizedBox(width: 8),
              const Text(
                "To",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              16.widthBox,
              Expanded(
                child: _SelectedTimeWidget(
                  time: fromHour,
                ),
              ),
              8.widthBox,
              Expanded(
                child: _SelectedTimeWidget(
                  time: fromMinute,
                ),
              ),
              8.widthBox,
              _SelectedTimeWidget(
                time: fromIsAm ? "AM" : "PM",
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ).pSymmetric(h: 16),
          20.heightBox,
          PrimaryOutlinedCard(
            height: 56,
            borderColor: context.primaryColor,
            borderWidth: 1,
            borderRadius: 8,
            backgroundColor: context.adaptive07,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedState.isEmpty ? "Select state" : selectedState,
                  style: TextStyle(
                    fontSize: 18,
                    color: selectedState.isEmpty
                        ? context.adaptive38
                        : Colors.black,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
          50.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvailabilityRowWidget(
                isPinned: true,
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(
            text: 'Next',
            textColor: Colors.white,
            onTap: () {},
          ),
        ],
      ).p16().safeArea(),
    );
  }
}

class _SelectedTimeWidget extends StatelessWidget {
  const _SelectedTimeWidget({
    required this.time,
    this.textStyle,
  });

  final dynamic time;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return PrimaryOutlinedCard(
      height: 56,
      borderColor: context.primaryColor,
      backgroundColor: Colors.white,
      borderRadius: 8,
      borderWidth: 1,
      child: Center(
        child: Text(
          time.toString().padLeft(2, '0'),
          style: textStyle ??
              TextStyle(
                fontSize: 24,
              ),
        ),
      ),
    );
  }
}
