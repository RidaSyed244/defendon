import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CircularCheckboxWithText extends HookWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  const CircularCheckboxWithText({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? context.primaryColor : Colors.transparent,
              border: Border.all(
                color: isSelected ? context.primaryColor : Colors.grey,
                width: 1.5,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          8.widthBox,
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: context.adaptive,
            ),
          ),
        ],
      ),
    );
  }
}
