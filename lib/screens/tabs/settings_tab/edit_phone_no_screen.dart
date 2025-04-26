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

class EditPhoneNoScreen extends HookWidget {
  const EditPhoneNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newPhoneNoController = useTextEditingController();
    final formKey = GlobalObjectKey<FormState>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            Text(
              "Edit your Phone no",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: context.primaryColor,
              ),
            ),
            20.heightBox,
            PrimaryTextField(
              keyboardType: TextInputType.number,
              controller: newPhoneNoController,
              hintText: "Enter new phone no",
              title: 'Phone no',
              validator: (value) => Validators.phoneValidator(value),
            ),
          ],
        ).p16().safeArea().scrollVertical(),
      ),
      bottomNavigationBar: PrimaryButton(
        onTap: () {
          if (!formKey.currentState!.validate()) return;
          context.nextPage(
            SuccessScreen(
              text: 'Phone no changed successfully!',
            ),
          );
        },
        text: "Update",
        textColor: Colors.white,
      ).p16().safeArea(),
    );
  }
}
