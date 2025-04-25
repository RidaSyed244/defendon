import 'package:defendon/screens/auth/verify_email_screen.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/validators.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ForgotPasswordScreen extends HookWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final formKey = GlobalObjectKey<FormState>(context);
    return Scaffold(
      appBar: ForgotPasswordAppBar(),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            80.heightBox,
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: context.adaptive,
                  size: 20,
                ),
                6.widthBox,
                Text(
                  'Back to login',
                  style: TextStyle(
                    color: context.adaptive,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            20.heightBox,
            Text(
              'Let’s reset your password.',
              style: TextStyle(
                color: context.primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            14.heightBox,
            Align(
              alignment: Alignment.center,
              child: Text(
                'We will email you a link you can use to reset your password.',
                style: TextStyle(
                  color: context.adaptive70,
                  fontSize: 14,
                ),
              ),
            ),
            26.heightBox,
            PrimaryTextField(
              title: 'Email Address',
              controller: emailController,
              hintText: 'Enter your email address',
              validator: (value) => Validators.emailValidator(value),
            ),
            30.heightBox,
            PrimaryButton(
              onTap: () {
                if (!formKey.currentState!.validate()) return;

                context.nextPage(
                  VerifyEmailScreen(),
                );
              },
              text: 'Next',
            ),
          ],
        ).p16().safeArea(),
      ),
    );
  }
}

class ForgotPasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ForgotPasswordAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        'Forgot Password?',
        style: TextStyle(
          color: context.adaptive,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
      ],
      centerTitle: true,
    );
  }
}
