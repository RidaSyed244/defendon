import 'package:defendon/screens/tabs/user_tabs/user_profile/set_availability_screen.dart';
import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:defendon/widgets/primary_profile_header_widget.dart';
import 'package:flutter/material.dart';

class UserProfileDetailsScreen extends StatelessWidget {
  const UserProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryProfileHeader(),
          30.heightBox,
          PrimaryOutlinedCard(
            padding: EdgeInsets.all(16),
            borderRadius: 12,
            backgroundColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ratings",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                14.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildRatingItem("1", "Servant", Colors.purple[700]!),
                    _buildRatingItem("2", "Watcher", Colors.purple[700]!),
                    _buildRatingItem("3", "Defender", Colors.purple[700]!),
                    _buildRatingItem("4", "Protector", Colors.purple[700]!),
                    _buildRatingItem("5", "Guardian", Colors.purple[700]!),
                  ],
                ),
              ],
            ),
          ),
          20.heightBox,
          Text(
            "Availbility",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          4.heightBox,
          PrimaryOutlinedCard(
            padding: EdgeInsets.all(16),
            backgroundColor: AppColors.secondaryClr,
            borderColor: AppColors.secondaryClr,
            borderRadius: 30,
            child: Column(
              children: [
                _buildAvailabilityRow(true),
                _buildAvailabilityRow(false),
                _buildAvailabilityRow(false),
                _buildAvailabilityRow(false),
                _buildAvailabilityRow(false),
              ],
            ),
          ),
          16.heightBox,
          PrimaryButton(
            text: 'Set your Availbility',
            textColor: Colors.white,
            borderRadius: 12,
            verticalPadding: 10,
            onTap: () {
              context.nextPage(
                SetAvailabilityScreen(),
              );
            },
          ).pSymmetric(h: 20),
        ],
      ).p16().safeArea(),
    );
  }

  Widget _buildRatingItem(String number, String title, Color color) {
    return Column(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.secondaryClr,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        8.heightBox,
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildAvailabilityRow(bool isPinned) {
    return Row(
      children: [
        Text(
          "31-10-2025",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        6.widthBox,
        if (isPinned) ...[
          Icon(
            Icons.location_pin,
            color: Colors.red,
            size: 18,
          )
        ] else ...[
          18.widthBox,
        ],
        2.widthBox,
        Text(
          "Helden st",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        10.widthBox,
        Text(
          "4:40",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.purple[700],
          ),
        ),
        Text(
          " pm",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 12),
        Text(
          "9:10",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.purple[700],
          ),
        ),
        Text(
          " pm",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
      ],
    ).pSymmetric(v: 4);
  }
}
