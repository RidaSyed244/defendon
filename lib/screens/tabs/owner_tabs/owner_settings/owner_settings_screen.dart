import 'package:defendon/screens/tabs/owner_tabs/owner_settings/change_password_screen.dart';
import 'package:defendon/screens/tabs/owner_tabs/owner_settings/invoices_screen.dart';
import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/image_builder.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:flutter/material.dart';

class OwnerSettingScreen extends StatelessWidget {
  const OwnerSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          20.heightBox,
          const ProfileHeader(
            name: "Matt",
            phone: "+1 610 440 4359",
            location: "Chicago, IL 60654",
          ),
          40.heightBox,
          const JobsStatsCard(
            totalPosted: 46,
            pendingJobs: 23,
            activeJobs: 58,
          ),
          20.heightBox,
          Expanded(
            child: ListView(
              children: [
                ProfileMenuOption(
                  icon: Icons.person,
                  title: "Edit Profile",
                ),
                ProfileMenuOption(
                  icon: Icons.description,
                  title: "Invoice",
                  onTap: (){
                    context.nextPage(
                      const InvoicesScreen(),
                    );
                  },
                ),
                ProfileMenuOption(
                  icon: Icons.lock,
                  title: "Change Password",
                  onTap: () {
                    context.nextPage(
                      ChangePasswordScreen(),
                    );
                  },
                ),
                ProfileMenuOption(
                  icon: Icons.phone,
                  title: "Change phone no",
                ),
                ProfileMenuOption(
                  icon: Icons.location_on,
                  title: "Edit Location",
                ),
                ProfileMenuOption(
                  icon: Icons.delete,
                  title: "Delete Account",
                ),
                ProfileMenuOption(
                  icon: Icons.logout,
                  title: "Logout",
                ),
                20.heightBox,
              ],
            ),
          ),
        ],
      ).p16().safeArea(),
    );
  }
}

class BackButtonRow extends StatelessWidget {
  const BackButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String name;
  final String phone;
  final String location;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.phone,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageBuilder.url(
          isCircular: true,
          url: '',
          size: const Size(100, 100),
          showEditIcon: false,
          nameLetter: 'U',
          badgeCount: 0,
        ),
        24.heightBox,
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        8.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_outlined,
              size: 18,
            ),
            4.widthBox,
            Text(
              "Phone : $phone",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        6.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 18,
            ),
            4.widthBox,
            Text(
              "Location : $location",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class JobsStatsCard extends StatelessWidget {
  final int totalPosted;
  final int pendingJobs;
  final int activeJobs;

  const JobsStatsCard({
    super.key,
    required this.totalPosted,
    required this.pendingJobs,
    required this.activeJobs,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryOutlinedCard(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      backgroundColor: AppColors.secondaryClr,
      borderRadius: 12,
      child: Row(
        children: [
          Expanded(
            child: StatsItem(
              label: "Total jobs\nPosted",
              value: totalPosted.toString(),
            ),
          ),
          Container(
            width: 1,
            height: 50,
            color: Colors.black12,
          ),
          Expanded(
            child: StatsItem(
              label: "Pending\nJobs",
              value: pendingJobs.toString(),
            ),
          ),
          Container(
            width: 1,
            height: 50,
            color: Colors.black12,
          ),
          Expanded(
            child: StatsItem(
              label: "Active\nJobs",
              value: activeJobs.toString(),
            ),
          ),
        ],
      ),
    );
  }
}

class StatsItem extends StatelessWidget {
  final String label;
  final String value;

  const StatsItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: context.primaryColor,
            ),
          ),
          4.heightBox,
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: context.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const ProfileMenuOption({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 0,
          ),
          leading: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: context.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: context.primaryColor,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: 28,
          ),
          onTap: onTap,
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: context.primaryColor,
        ),
      ],
    );
  }
}
