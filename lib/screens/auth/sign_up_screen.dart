import 'package:defendon/screens/auth/log_in_screen.dart';
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

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final formKey = GlobalObjectKey<FormState>(context);

    final isPasswordVisible = useState(false);
    final selectedState = useState<String>('');
    final states = [
      'Punjab',
      'Sindh',
      'KPK',
      'Balochistan',
      'Islamabad',
    ];

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            Text(
              'Create your account',
              style: TextStyle(
                color: context.primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'Complete name',
              controller: nameController,
              hintText: 'Enter your name',
              validator: (value) => Validators.nameValidator(value),
            ),
            20.heightBox,
            Text(
              'Select your state',
              style: TextStyle(color: context.adaptive),
            ).pOnly(left: 4, bottom: 4),
            DropdownButtonFormField<String>(
              value: selectedState.value.isEmpty ? null : selectedState.value,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: (1) > 1 ? 16 : 0,
                ),
                errorMaxLines: 3,
                fillColor: context.adaptive05,
                filled: true,

                // 🔽 Default border (not focused)
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.2,
                    color: context.primaryColor, // light primary
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),

                // 🔽 When focused
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.2,
                    color: context.primaryColor, // main primary
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),

                // 🔽 When there's an error
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.2,
                    color: Colors.red, // or context.theme.errorColor
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),

                // 🔽 When focused *and* error
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.2,
                    color: Colors.redAccent,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),

                hintText: 'Choose your state',
              ),
              items: states.map((state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              onChanged: (value) {
                selectedState.value = value ?? '';
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a state';
                }
                return null;
              },
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'Email Address',
              controller: emailController,
              hintText: 'Enter your email address',
              validator: (value) => Validators.emailValidator(value),
            ),
            20.heightBox,
            PrimaryTextField(
              keyboardType: TextInputType.phone,
              title: 'Phone no',
              controller: phoneController,
              hintText: 'Enter your phone no',
              validator: (value) => Validators.phoneValidator(value),
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
            20.heightBox,
            PrimaryButton(
              onTap: () {
                if (!formKey.currentState!.validate()) return;

                context.nextPage(VerifyEmailScreen());
              },
              text: 'Register',
            ),
            14.heightBox,
            InkWell(
              onTap: () {
                context.nextPage(LogInScreen());
              },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Login Now',
                  style: TextStyle(
                    color: context.adaptive,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ).p16().scrollVertical().safeArea(),
      ),
    );
  }
}
