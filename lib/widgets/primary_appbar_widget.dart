import 'package:defendon/utils/extensions.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;

  const PrimaryAppBar({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      leading: GestureDetector(
        onTap: onBack ?? () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.only(
            left: 16,
            top: 12,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          width: 40,
          height: 36,
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: context.adaptive,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
