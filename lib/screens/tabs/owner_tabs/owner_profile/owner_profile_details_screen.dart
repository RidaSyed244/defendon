import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:defendon/widgets/primary_profile_header_widget.dart';
import 'package:flutter/material.dart';

class OwnerProfileDetailsScreen extends StatelessWidget {
  const OwnerProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
        ),
      ),
      body: Column(
        children: [
          PrimaryProfileHeader(),
          30.heightBox,
          PrimaryOutlinedCard(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            borderColor: context.primaryColor,
            borderWidth: 1,
            borderRadius: 16,
            backgroundColor: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailItem(label: "Name:"),
                8.heightBox,
                ProfileDetailItem(label: "Company Name:"),
                8.heightBox,
                ProfileDetailItem(label: "Company registration no:"),
                8.heightBox,
                ProfileDetailItem(label: "State:"),
                8.heightBox,
                ProfileDetailItem(label: "Location:"),
                8.heightBox,
                ProfileDetailItem(label: "phone no:"),
                8.heightBox,
                ProfileDetailItem(label: "No of emp:"),
              ],
            ),
          ),
          40.heightBox,
          PrimaryButton(
            onTap: () {},
            text: 'Check your active orders',
            textColor: Colors.white,
          ),
        ],
      ).p16().safeArea(),
    );
  }
}

class ProfileDetailItem extends StatelessWidget {
  final String label;
  final String? value;

  const ProfileDetailItem({
    super.key,
    required this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (value != null) ...[
          Text(
            value!,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ]
      ],
    );
  }
}
