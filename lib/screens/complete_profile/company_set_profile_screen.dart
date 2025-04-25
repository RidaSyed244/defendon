import 'package:defendon/screens/tabs/owner_tabs_view.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/validators.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_appbar_widget.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CompanySetProfileScreen extends HookWidget {
  const CompanySetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final addressController = useTextEditingController();
    final regNoController = useTextEditingController();
    final empController = useTextEditingController();
    final formKey = GlobalObjectKey<FormState>(context);

    return Scaffold(
      appBar: PrimaryAppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Tell us about your company',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor,
                ),
              ),
            ),
            30.heightBox,
            PrimaryTextField(
              title: 'Company Name',
              controller: nameController,
              hintText: 'Enter your company name',
              validator: (value) => Validators.nameValidator(value),
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'Registered Address',
              controller: addressController,
              hintText: 'Enter your address',
              validator: (value) => Validators.addressValidator(value),
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'Company Registration no',
              controller: regNoController,
              hintText: 'Enter your reg no.',
              validator: (value) =>
                  Validators.registrationNumberValidator(value),
            ),
            20.heightBox,
            PrimaryTextField(
              title: 'No of Emp',
              controller: empController,
              hintText: 'Enter your no. of emp',
              validator: (value) =>
                  Validators.numberOfEmployeesValidator(value),
            ),
          ],
        ).p16().safeArea().scrollVertical(),
      ),
      bottomNavigationBar: PrimaryButton(
        onTap: () {
          if (!formKey.currentState!.validate()) return;
          context.nextAndRemoveUntilPage(
            OwnerTabsView(),
          );
        },
        text: 'Continue',
        borderRadius: 10,
        verticalPadding: 18,
        textColor: Colors.white,
      ).p16().safeArea(),
    );
  }
}
