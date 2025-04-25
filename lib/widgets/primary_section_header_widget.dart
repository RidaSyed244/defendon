import 'package:defendon/controllers/search_controller.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimarySearchBar extends StatelessWidget {
  final String hintText;
  final Function(String)? onSearch;
  final Color? searchIconBgColor;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;

  const PrimarySearchBar({
    super.key,
    this.hintText = "Search a invoice",
    this.onSearch,
    this.searchIconBgColor,
    this.margin,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final SearchBarController controller = Get.put(SearchBarController());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.outline,
          width: 0.3,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller.textController,
                onChanged: (value) {
                  controller.updateSearchQuery(value);
                  if (onSearch != null) {
                    onSearch!(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: searchIconBgColor ?? context.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
