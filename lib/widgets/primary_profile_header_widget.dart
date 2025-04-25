import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/image_builder.dart';
import 'package:flutter/material.dart';

class PrimaryProfileHeader extends StatelessWidget {
  const PrimaryProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageBuilder.url(
          isCircular: true,
          // onTap: () => context.nextPage(const AccountPage()),
          url: '',
          nameLetter: 'U',
          size: const Size(90, 90),
          showEditIcon: false,
          badgeCount: 0,
        ),
        20.widthBox,
        const Text(
          'Bruce Wayne',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
