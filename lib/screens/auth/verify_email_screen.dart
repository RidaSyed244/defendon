import 'package:defendon/screens/auth/company_upload_image_screen.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerifyEmailScreen extends HookWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pinController = useTextEditingController();
    final otpValue = useState('');
    final showInvalidOtpError = useState(false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.heightBox,
          Text(
            'Verify your Email',
            style: TextStyle(
              color: context.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          12.heightBox,
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Enter the code that was sent to ",
                  style: TextStyle(
                    color: context.adaptive,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'hattrick@solution.com',
                  style: TextStyle(
                    color: context.primaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          20.heightBox,
          Align(
            alignment: Alignment.bottomLeft,
            child: VerificationCode(
              fullBorder: true,
              textStyle: TextStyle(
                fontSize: 20,
                color: context.primaryColor,
              ),
              keyboardType: TextInputType.number,
              underlineColor: context.adaptive12,
              length: 4,
              cursorColor: context.primaryColor,
              onCompleted: (String value) {
                otpValue.value = value;
                pinController.text = value;
                showInvalidOtpError.value = false;
              },
              onEditing: (bool value) {},
            ),
          ),

          // Validation Error Message
          if (showInvalidOtpError.value)
            Text(
              "Please enter a valid 4-digit code",
              style: TextStyle(color: Colors.red, fontSize: 14),
            ).pOnly(top: 8),

          20.heightBox,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Did not receive the code?',
              style: TextStyle(
                color: context.adaptive,
                fontSize: 16,
              ),
            ),
          ),
          20.heightBox,

          12.heightBox,
          PrimaryButton(
            onTap: () {
              context.nextPage(
                CompanyUploadImageScreen(),
              );
            },
            text: 'Resend Code',
          ),
        ],
      ).p16().safeArea(),
    );
  }
}
