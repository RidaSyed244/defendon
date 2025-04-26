import 'package:defendon/screens/complete_profile/company_set_profile_screen.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/image_builder.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CompanyUploadImageScreen extends StatelessWidget {
  const CompanyUploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            'Step 1/2',
          ).pOnly(right: 10),
        ],
      ),
      body: Column(
        children: [
          160.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageBuilder(
                circleColor: context.primaryColor,
                isCircular: true,
                showBorder: true,
                size: Size(100, 100),
                showEditIcon: true,
                url: null,
                file: null,
                onChanged: (file) {},
                onTap: () {},
              ),
            ],
          ),
          14.heightBox,
          Text(
            'Upload Image',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.primaryColor,
            ),
          ),
          160.heightBox,
          PrimaryButton(
            onTap: () {
              context.nextPage(
                CompanySetProfileScreen(),
              );
            },
            text: 'Next',
            textColor: Colors.white,
          ),
        ],
      ).p16().safeArea().scrollVertical(),
    );
  }
}
