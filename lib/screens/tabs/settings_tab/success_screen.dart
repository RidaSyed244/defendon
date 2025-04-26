import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/images.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  final String text;
  const SuccessScreen({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.passwordSuccess,
              height: 160,
            ),
            30.heightBox,
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: context.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ).p16().safeArea(),
      ),
      bottomNavigationBar: PrimaryButton(
        onTap: () {
          Get.back();
          Get.back();
        },
        text: "Back",
        textColor: Colors.white,
      ).p16().safeArea(),
    );
  }
}
