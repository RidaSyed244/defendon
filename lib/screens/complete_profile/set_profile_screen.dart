import 'package:defendon/screens/complete_profile/add_profile_details_screen.dart';
import 'package:defendon/screens/complete_profile/birthdate_picker_dialog.dart';
import 'package:defendon/screens/complete_profile/gender_selection_dialog.dart';
import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/validators.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_appbar_widget.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_checkbox_widget.dart';
import 'package:defendon/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SetProfileScreen extends HookWidget {
  const SetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qualificationController = useTextEditingController();
    final passingYearController = useTextEditingController();
    final selectedYear = useState<String?>(null);
    final isMasterDegreeSelected = useState<bool>(false);
    final isDiplomaSelected = useState<bool>(false);
    final isSupervisor = useState<bool>(false);
    final isIncharge = useState<bool>(false);
    final formKey = GlobalObjectKey<FormState>(context);

    final List<String> years = List.generate(
      DateTime.now().year - 1980 + 1,
      (index) => (1980 + index).toString(),
    ).reversed.toList();

    return Scaffold(
      appBar: PrimaryAppBar(),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Tell us who you are',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor,
                ),
              ),
            ),
            12.heightBox,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: PrimaryTextField(
                    controller: qualificationController,
                    hintText: 'Enter Title only',
                    title: 'Qualification',
                    validator: (value) => Validators.titleValidator(value),
                  ),
                ),
                10.widthBox,
                Expanded(
                  child: PrimaryTextField(
                    controller: passingYearController,
                    title: 'Passing Year',
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: context.primaryColor,
                    ),
                    onTap: () async {
                      final selected = await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text('Select Passing Year',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: context.primaryColor,
                                )),
                            content: SizedBox(
                              width: double.maxFinite,
                              height: 300,
                              child: ListView(
                                children: years
                                    .map(
                                      (year) => ListTile(
                                        title: Text(year,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: context.primaryColor,
                                            )),
                                        onTap: () {
                                          Navigator.of(context).pop(year);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      );

                      if (selected != null) {
                        selectedYear.value = selected;
                        passingYearController.text = selected;
                      }
                    },
                  ),
                ),
              ],
            ),
            10.heightBox,
            CircularCheckboxWithText(
              text: "Master in computer science",
              isSelected: isMasterDegreeSelected.value,
              onTap: () {
                isMasterDegreeSelected.value = !isMasterDegreeSelected.value;
              },
            ),
            10.heightBox,
            CircularCheckboxWithText(
              text: "Diploma in security",
              isSelected: isDiplomaSelected.value,
              onTap: () {
                isDiplomaSelected.value = !isDiplomaSelected.value;
              },
            ),
            16.heightBox,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: PrimaryTextField(
                    controller: qualificationController,
                    hintText: 'Enter Title only',
                    title: 'Experience',
                  ),
                ),
                8.widthBox,
                Expanded(
                  child: PrimaryTextField(
                    controller: passingYearController,
                    title: 'From',
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: context.primaryColor,
                    ),
                    onTap: () async {
                      final selected = await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text('Select Passing Year',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: context.primaryColor,
                                )),
                            content: SizedBox(
                              width: double.maxFinite,
                              height: 300,
                              child: ListView(
                                children: years
                                    .map(
                                      (year) => ListTile(
                                        title: Text(year,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: context.primaryColor,
                                            )),
                                        onTap: () {
                                          Navigator.of(context).pop(year);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      );

                      if (selected != null) {
                        selectedYear.value = selected;
                        passingYearController.text = selected;
                      }
                    },
                  ),
                ),
                8.widthBox,
                Expanded(
                  child: PrimaryTextField(
                    controller: passingYearController,
                    title: 'To',
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: context.primaryColor,
                    ),
                    onTap: () async {
                      final selected = await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text('Select Passing Year',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: context.primaryColor,
                                )),
                            content: SizedBox(
                              width: double.maxFinite,
                              height: 300,
                              child: ListView(
                                children: years
                                    .map(
                                      (year) => ListTile(
                                        title: Text(year,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: context.primaryColor,
                                            )),
                                        onTap: () {
                                          Navigator.of(context).pop(year);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      );

                      if (selected != null) {
                        selectedYear.value = selected;
                        passingYearController.text = selected;
                      }
                    },
                  ),
                ),
              ],
            ),
            10.heightBox,
            CircularCheckboxWithText(
              text: "Supervisor",
              isSelected: isSupervisor.value,
              onTap: () {
                isSupervisor.value = !isSupervisor.value;
              },
            ),
            10.heightBox,
            CircularCheckboxWithText(
              text: "Incharge",
              isSelected: isIncharge.value,
              onTap: () {
                isIncharge.value = !isIncharge.value;
              },
            ),
            40.heightBox,
            PrimaryButton(
              borderRadius: 12,
              textColor: Colors.white,
              verticalPadding: 18,
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BirthDatePickerDialog(
                      onDateSelected: (month, day, year) {},
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Text(
                    'Birthdate',
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            16.heightBox,
            PrimaryButton(
              borderRadius: 12,
              textColor: Colors.white,
              verticalPadding: 18,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GenderSelectionDialog(
                      onGenderSelected: (selectedGender) {
                        // Here you can handle the selected gender
                        // For example, store it in a state variable
                        print('Selected gender: $selectedGender');
                        // You might want to add:
                        // final selectedGender = useState<String?>(null);
                        // Then update it here:
                        // selectedGender.value = selectedGender;
                      },
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            16.heightBox,
            PrimaryButton(
              borderRadius: 12,
              textColor: Colors.white,
              verticalPadding: 18,
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Select Language',
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ).p16().safeArea().scrollVertical(),
      ),
      bottomNavigationBar: PrimaryButton(
        borderRadius: 12,
        textColor: Colors.white,
        verticalPadding: 18,
        onTap: () {
          if (!formKey.currentState!.validate()) return;

          context.nextPage(AddProfiledetailsScreen());
        },
        text: 'Continue',
      ).p16().safeArea(),
    );
  }
}
