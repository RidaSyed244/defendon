import 'package:defendon/screens/tabs/settings_tab/success_screen.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/validators.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChangePasswordScreen extends HookWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final isConfirmPasswordVisible = useState(false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.heightBox,
          Text(
            "Change Password",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: context.primaryColor,
            ),
          ),
          20.heightBox,
          PrimaryTextField(
            controller: newPasswordController,
            hintText: "Enter new Password",
            validator: (value) => Validators.passwordValidator(value),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible.value
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: context.primaryColor,
              ),
              onPressed: () {
                isPasswordVisible.value = !isPasswordVisible.value;
              },
            ),
          ),
          30.heightBox,
          PrimaryTextField(
            controller: confirmPasswordController,
            hintText: "Enter confirm password",
            validator: (value) => Validators.confirmPasswordValidator(
              value,
              newPasswordController.text,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isConfirmPasswordVisible.value
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: context.primaryColor,
              ),
              onPressed: () {
                isConfirmPasswordVisible.value =
                    !isConfirmPasswordVisible.value;
              },
            ),
          ),
        ],
      ).p16().safeArea().scrollVertical(),
      bottomNavigationBar: PrimaryButton(
        onTap: () {
          context.nextPage(
            SuccessScreen(
              text: 'Password Changed Successfully!',
            ),
          );
        },
        text: "Change Password",
        textColor: Colors.white,
      ).p16().safeArea(),
    );
  }
}
