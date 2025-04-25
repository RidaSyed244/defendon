import 'package:defendon/screens/auth/forgot_password_screen.dart';
import 'package:defendon/screens/auth/looking_for_screen.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/images.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/validators.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LogInScreen extends HookWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final formKey = GlobalObjectKey<FormState>(context);

    return Scaffold(
      body: Form(
        child: Column(
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
            Text(
              'Login to your account',
              style: TextStyle(
                color: context.primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            30.heightBox,
            PrimaryTextField(
              title: 'Email Address',
              controller: emailController,
              hintText: 'Enter your email address',
              validator: (value) => Validators.emailValidator(value),
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'Password',
              controller: passwordController,
              hintText: 'Enter your password',
              obscureText: !isPasswordVisible.value,
              validator: (value) => Validators.passwordValidator(value),
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible.value
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: context.adaptive54,
                ),
                onPressed: () {
                  isPasswordVisible.value = !isPasswordVisible.value;
                },
              ),
            ),
            30.heightBox,
            PrimaryButton(
              onTap: () {
                context.nextPage(LookingForScreen());
              },
              text: 'Login',
            ),
            20.heightBox,
            InkWell(
              onTap: () {
                context.nextPage(ForgotPasswordScreen());
              },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: context.adaptive,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            10.heightBox,
            InkWell(
              onTap: () {
                if (!formKey.currentState!.validate()) return;

                context.nextPage(LookingForScreen());
              },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Register Now',
                  style: TextStyle(
                    color: context.adaptive,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ).p16().safeArea(),
      ),
    );
  }
}
