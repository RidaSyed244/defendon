import 'package:defendon/controllers/bottom_nav_tabs_controller.dart';
import 'package:defendon/screens/tabs/owner_tabs/owner_home/owner_home_tab.dart';
import 'package:defendon/screens/tabs/owner_tabs/owner_jobs/owner_jobs_management_screen.dart';
import 'package:defendon/screens/tabs/owner_tabs/owner_profile/owner_profile_details_screen.dart';
import 'package:defendon/screens/tabs/owner_tabs/owner_settings/owner_settings_screen.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/images.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerTabsView extends StatelessWidget {
  const OwnerTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabsController());

    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              OwnerHomeScreen(),
              OwnerProfileDetailsScreen(),
              OwnerJobsManagementScreen(),
              OwnerSettingScreen(),
            ],
          ),
          bottomNavigationBar: const _BottomNavigationBar(),
        ));
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TabsController>();

    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 0,
              color: context.adaptive07,
            ),
            BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (value) => controller.changeTab(value),
              type: BottomNavigationBarType.fixed,
              backgroundColor: context.primaryColor,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: _buildIcon(
                    isSelected: controller.currentIndex.value == 0,
                    selectedIcon: Images.homeSelected,
                    unselectedIcon: Images.homeUnselected,
                  ).py(7),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(
                    isSelected: controller.currentIndex.value == 1,
                    selectedIcon: Images.personSelected,
                    unselectedIcon: Images.personUnselected,
                  ).py(7),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(
                    isSelected: controller.currentIndex.value == 2,
                    selectedIcon: Images.shareSelected,
                    unselectedIcon: Images.shareUnselected,
                  ).py(7),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(
                    isSelected: controller.currentIndex.value == 3,
                    selectedIcon: Images.settingSelected,
                    unselectedIcon: Images.settingUnselected,
                  ).py(7),
                  label: '',
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildIcon({
    required bool isSelected,
    required String selectedIcon,
    required String unselectedIcon,
  }) {
    return Image.asset(
      isSelected ? selectedIcon : unselectedIcon,
      width: 24,
      height: 24,
    );
  }
}
