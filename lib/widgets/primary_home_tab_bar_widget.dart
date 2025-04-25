import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/image_builder.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:flutter/material.dart';

class PrimaryHomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String description;
  const PrimaryHomeTabBar({
    super.key,
    required this.title,
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: context.primaryColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageBuilder.url(
                isCircular: true,
                // onTap: () => context.nextPage(const AccountPage()),
                url: '',
                size: const Size(55, 55),
                showEditIcon: false,
                badgeCount: 0,
              ),
              12.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: context.adaptive,
                    ),
                  ),
                  2.heightBox,
                  Text(
                    "Welcome! Let's Make Your Event Secure",
                    style: TextStyle(
                      fontSize: 12,
                      color: context.adaptive38,
                    ),
                  ),
                ],
              ),
            ],
          ),
          PrimaryOutlinedCard(
            backgroundColor: Colors.transparent,
            borderRadius: 8,
            child: Icon(
              Icons.notifications_outlined,
            ),
          ).p4()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
