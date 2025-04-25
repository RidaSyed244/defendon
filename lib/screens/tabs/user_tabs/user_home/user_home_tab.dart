import 'package:defendon/screens/tabs/owner_tabs/owner_home/week_picker_widget.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/images.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_home_tab_bar_widget.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryHomeTabBar(
        title: 'Hi, Bruce',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Images.homeBanner,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
            20.heightBox,
            WeekPickerWidget(),
            26.heightBox,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Images.statsAndRatingBg,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  top: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Stats and Ratings",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          4.heightBox,
                          Text(
                            "458 Jobs completed.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: context.adaptive38,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          Images.badge,
                          fit: BoxFit.contain,
                        ).p8(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: PrimaryButton(
                    onTap: () {},
                    text: "Set your Availbility",
                    textColor: Colors.white,
                    width: double.infinity,
                    borderRadius: 12,
                    verticalPadding: 10,
                  ),
                ),
              ],
            ),
            20.heightBox,
            Text(
              "How it work?",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            4.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dotText("This is instruction to use this application"),
                _dotText("This is instruction to use this application"),
                _dotText("This is instruction to use this application"),
                _dotText("This is instruction to use this application"),
              ],
            ),
          ],
        ).p16(),
      ).safeArea(),
    );
  }

  Widget _dotText(String text) {
    return Row(
      children: [
        Text(
          "• ",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
