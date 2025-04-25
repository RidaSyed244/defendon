import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class GenderSelectionDialog extends StatefulWidget {
  final Function(String) onGenderSelected;

  const GenderSelectionDialog({
    super.key,
    required this.onGenderSelected,
  });

  @override
  State<GenderSelectionDialog> createState() => _GenderSelectionDialogState();
}

class _GenderSelectionDialogState extends State<GenderSelectionDialog> {
  String? selectedGender;

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
            'Select Gender',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: context.adaptive,
            ),
          ),
          const SizedBox(height: 40),
          _buildGenderOption('Male'),
          const SizedBox(height: 24),
          _buildGenderOption('Female'),
          const SizedBox(height: 24),
          _buildGenderOption('Prefer not to say'),
          const SizedBox(height: 40),
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
                  onTap: selectedGender != null
                      ? () {
                          widget.onGenderSelected(selectedGender!);
                          Navigator.pop(context);
                        }
                      : () {},
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

  Widget _buildGenderOption(String gender) {
    final isSelected = selectedGender == gender;

    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            gender,
            style: TextStyle(
              fontSize: 21,
              color: context.adaptive38,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Color(0xFFFAE8E8) : Colors.grey.shade200,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
