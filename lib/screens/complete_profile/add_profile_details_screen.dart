import 'package:defendon/screens/tabs/user_tabs_view.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/validators.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/image_builder.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddProfiledetailsScreen extends HookWidget {
  const AddProfiledetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final personalAddress = useTextEditingController();
    final licenseController = useTextEditingController();
    final formKey = GlobalObjectKey<FormState>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            'Step 1/2',
          ).pOnly(right: 10),
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageBuilder(
                  circleColor: context.primaryColor,
                  isCircular: true,
                  showBorder: true,
                  size: Size(96, 96),
                  showEditIcon: true,
                  url: null,
                  file: null,
                  onChanged: (file) {},
                  onTap: () {},
                ),
              ],
            ),
            24.heightBox,
            Text(
              'User Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: context.primaryColor,
              ),
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'Name',
              controller: nameController,
              hintText: 'Enter your name',
              validator: (value) => Validators.nameValidator(value),
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'Personal Address',
              controller: personalAddress,
              hintText: 'Enter your address',
              validator: (value) => Validators.addressValidator(value),
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'SIA LICENSE BADGE NO',
              controller: licenseController,
              hintText: 'Enter your license number',
              validator: (value) => Validators.licenseValidator(value),
            ),
            60.heightBox,
            PrimaryButton(
              onTap: () {
                if (!formKey.currentState!.validate()) return;

                context.nextAndRemoveUntilPage(
                  UserTabsView(),
                );
              },
              text: 'Next',
              textColor: Colors.white,
            ),
          ],
        ).p16().safeArea().scrollVertical(),
      ),
    );
  }
}
