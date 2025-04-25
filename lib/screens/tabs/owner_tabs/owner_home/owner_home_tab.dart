import 'package:defendon/screens/tabs/owner_tabs/owner_home/week_picker_widget.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/images.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_home_tab_bar_widget.dart';
import 'package:flutter/material.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

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
            Text(
              'Security Packages',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: context.adaptive,
              ),
            ),
            12.heightBox,
            Image.asset(
              Images.soloPkg,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
            16.heightBox,
            PrimaryButton(
              verticalPadding: 12,
              onTap: () {},
              isOutline: true,
              text: 'Choose and Pay',
              textColor: context.primaryColor,
            ),
            12.heightBox,
            Image.asset(
              Images.guardPkg,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
            16.heightBox,
            PrimaryButton(
              verticalPadding: 12,
              onTap: () {},
              isOutline: true,
              text: 'Choose and Pay',
              textColor: context.primaryColor,
            ),
          ],
        ).p16(),
      ).safeArea(),
    );
  }
}
