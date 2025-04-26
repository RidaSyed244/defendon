import 'package:defendon/controllers/job_controller.dart';
import 'package:defendon/models/job_model.dart';
import 'package:defendon/screens/tabs/jobs_tab/security_guard_booking_screen.dart';
import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/date_time_extensions.dart';
import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/navigation_extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:defendon/widgets/primary_outline_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class OwnerJobsManagementScreen extends HookWidget {
  const OwnerJobsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JobController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Job Management',
        ),
      ),
      body: Column(
        children: [
          _buildTabs(controller),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.filteredJobs.length,
                  itemBuilder: (context, index) {
                    final job = controller.filteredJobs[index];
                    return JobCard(
                      job: job,
                      onTap: () {
                        context.nextPage(
                          SecurityGuardBookingScreen(
                            isAdmin: true,
                          ),
                        );
                      },
                    );
                  },
                )),
          ),
        ],
      ).p16().safeArea(),
    );
  }

  Widget _buildTabs(JobController controller) {
    return PrimaryOutlinedCard(
      backgroundColor: AppColors.secondaryClr,
      borderColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      borderRadius: 10,
      child: Row(
        children: [
          _buildTabButton(
            'Completed',
            JobStatus.completed,
            controller,
          ),
          _buildTabButton(
            'Pending',
            JobStatus.pending,
            controller,
          ),
          _buildTabButton(
            'Active',
            JobStatus.active,
            controller,
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(
    String title,
    JobStatus status,
    JobController controller,
  ) {
    return Expanded(
      child: Obx(() {
        final isSelected = controller.selectedTab.value == status;
        return PrimaryOutlinedCard(
          onTap: () => controller.changeTab(status),
          padding: const EdgeInsets.symmetric(vertical: 12),
          borderColor: Colors.transparent,
          backgroundColor: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: 10,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        );
      }),
    );
  }
}

class JobCard extends StatelessWidget {
  final JobModel job;
  final VoidCallback onTap;
  const JobCard({
    super.key,
    required this.job,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryOutlinedCard(
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      onTap: onTap,
      padding: EdgeInsets.zero,
      borderColor: Colors.transparent,
      borderRadius: 18,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            job.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${job.price.toInt()}\$',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            6.widthBox,
                            PrimaryOutlinedCard(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              borderColor: context.primaryColor,
                              child: Text(
                                '${job.status.name.capitalizeFirst}',
                                style: TextStyle(
                                  color: getJobStatusColor(job.status),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    8.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: context.adaptive38,
                        ),
                        2.widthBox,
                        Text(
                          job.location,
                          style: TextStyle(
                            color: context.adaptive38,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ).pSymmetric(
            v: 10,
            h: 10,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              color: context.primaryColor,
              child: Column(
                children: [
                  Text(
                    job.packageType,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 18,
                          ),
                          8.widthBox,
                          Text(
                            job.date.shortDate,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '---------',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 18,
                          ),
                          8.widthBox,
                          Text(
                            job.timeSlot,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).pSymmetric(h: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getJobStatusColor(JobStatus status) {
    switch (status) {
      case JobStatus.completed:
        return Colors.green;
      case JobStatus.pending:
        return Colors.red;
      case JobStatus.active:
        return Colors.orange;
    }
  }
}
