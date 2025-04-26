import 'package:defendon/models/job_model.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  final jobs = <JobModel>[].obs;
  final Rx<JobStatus> selectedTab = JobStatus.completed.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJobs();
  }

  void fetchJobs() {
    final allJobs = [
      JobModel(
        title: 'Security for Birthday event',
        location: 'Chester,Manchester',
        price: 60,
        status: JobStatus.completed,
        date: DateTime(2025, 6, 16),
        timeSlot: '12:00 - 12:45',
        packageType: 'Solo Package',
      ),
      JobModel(
        title: 'Security for Birthday event',
        location: 'Chester,Manchester',
        price: 60,
        status: JobStatus.pending,
        date: DateTime(2025, 6, 16),
        timeSlot: '12:00 - 12:45',
        packageType: 'Solo Package',
      ),
      JobModel(
        title: 'Security for Birthday event',
        location: 'Chester,Manchester',
        price: 60,
        status: JobStatus.active,
        date: DateTime(2025, 6, 16),
        timeSlot: '12:00 - 12:45',
        packageType: 'Solo Package',
      ),
      JobModel(
        title: 'Security for Birthday event',
        location: 'Chester,Manchester',
        price: 60,
        status: JobStatus.completed,
        date: DateTime(2025, 6, 16),
        timeSlot: '12:00 - 12:45',
        packageType: 'Solo Package',
      ),
      JobModel(
        title: 'Security for Birthday event',
        location: 'Chester,Manchester',
        price: 60,
        status: JobStatus.completed,
        date: DateTime(2025, 6, 16),
        timeSlot: '12:00 - 12:45',
        packageType: 'Solo Package',
      ),
    ];

    jobs.assignAll(allJobs);
  }

  void changeTab(JobStatus status) {
    selectedTab.value = status;
  }

  List<JobModel> get filteredJobs =>
      jobs.where((job) => job.status == selectedTab.value).toList();
}
