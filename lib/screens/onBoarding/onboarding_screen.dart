import 'package:defendon/controllers/navigation_controller.dart';
import 'package:defendon/controllers/onboarding_controller.dart';
import 'package:defendon/models/onboarding_model.dart';
import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Get.find<NavigationService>().completeOnboarding();
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: context.adaptive,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ).pOnly(right: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: OnBoardingData.onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  data: OnBoardingData.onboardingPages[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnBoardingData data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            data.assetPath,
            height: 150,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              28.heightBox,
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ).pSymmetric(
                h: 32,
                v: 12,
              ),
              OnboardingControls(),
            ],
          ),
        ),
      ],
    );
  }
}

class OnboardingControls extends StatelessWidget {
  const OnboardingControls({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryButton(
          width: 180,
          color: AppColors.secondaryClr,
          borderRadius: 0,
          textColor: context.primaryColor,
          text: 'NEXT',
          onTap: () async {
            if (controller.currentPage.value ==
                OnBoardingData.onboardingPages.length - 1) {
              await Get.find<NavigationService>().completeOnboarding();
            } else {
              controller.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
        ),
        32.heightBox,
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                OnBoardingData.onboardingPages.asMap().entries.map((entry) {
              final index = entry.key;
              return GestureDetector(
                onTap: () => controller.goToPage(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 8,
                  width: controller.currentPage.value == index ? 36 : 8,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? AppColors.secondaryClr
                        : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }).toList(),
          );
        }),
        16.heightBox,
      ],
    ).p16();
  }
}
