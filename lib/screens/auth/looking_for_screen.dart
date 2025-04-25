import 'package:defendon/screens/auth/sign_up_screen.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/images.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LookingForScreen extends StatelessWidget {
  const LookingForScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images.logo,
                height: 220,
              ),
            ],
          ),
          10.heightBox,
          Text(
            'What are you looking for?',
            style: TextStyle(
              color: context.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          30.heightBox,
          PrimaryButton(
            onTap: () {
              context.nextPage(SignUpScreen());
            },
            text: 'Hire Professional Security Guard',
            textColor: Colors.white,
          ),
          30.heightBox,
          PrimaryButton(
            onTap: () {
              context.nextPage(SignUpScreen());
            },
            text: 'Good Security Job',
            textColor: Colors.white,
          ),
        ],
      ).p16().safeArea(),
    );
  }
}
