import 'package:defendon/screens/tabs/jobs_tab/rating_customer_screen.dart';
import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_button.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:defendon/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SecurityGuardBookingScreen extends HookWidget {
  final bool isAdmin;
  const SecurityGuardBookingScreen({
    super.key,
    this.isAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(
      text: 'I need one energetic guard for birthday of my daughter.',
    );
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Security Guard for Birthday Event',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.primaryColor,
            ),
          ),
          20.heightBox,
          PrimaryTextField(
            controller: textController,
            hintText: 'Search for a guard',
            maxLines: 5,
            minLines: 4,
          ),
          10.heightBox,
          Text(
            'Time & Location',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: context.primaryColor,
            ),
          ),
          20.heightBox,
          PrimaryButton(
            color: Color(0xFFE6D5F5),
            onTap: () {},
            text: 'Chester #123 main street Manchester',
            textStyle: TextStyle(
              color: context.primaryColor,
              fontSize: 16,
            ),
          ),
          20.heightBox,
          PrimaryOutlinedCard(
            padding: const EdgeInsets.all(18.0),
            backgroundColor: context.primaryColor,
            borderRadius: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Booked',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                4.heightBox,
                Row(
                  children: [
                    const Text(
                      '60£',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.secondaryClr,
                          child: Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: context.primaryColor,
                          ),
                        ),
                        8.widthBox,
                        Text(
                          '16 jun 2025',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    20.widthBox,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.secondaryClr,
                          child: Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: context.primaryColor,
                          ),
                        ),
                        8.widthBox,
                        Text(
                          '16 jun 2025',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                12.heightBox,
                // You can handle UI here like in figma ('Start Job' and 'Finish Job') using conditions.
                if (!isAdmin) ...[
                  PrimaryButton(
                    onTap: () {},
                    text: 'Accept',
                    borderRadius: 10,
                    textColor: Colors.black,
                    color: AppColors.secondaryClr,
                  ),
                  14.heightBox,
                  PrimaryButton(
                    onTap: () {
                      context.nextPage(
                        RatingCustomerScreen(),
                      );
                    },
                    text: 'Decline',
                    borderRadius: 10,
                    textColor: Colors.black,
                    color: AppColors.secondaryClr,
                  ),
                ],
              ],
            ),
          ),
          40.heightBox,
          if (isAdmin) ...[
            PrimaryButton(
              onTap: () {},
              text: 'Rate & Review Guard',
              textColor: Colors.white,
            ),
          ],
        ],
      ).p16().safeArea(),
    );
  }
}
