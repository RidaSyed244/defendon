enum JobStatus {
  completed,
  pending,
  active,
}

class JobModel {
  final String title;
  final String location;
  final double price;
  final JobStatus status;
  final DateTime date;
  final String timeSlot;
  final String packageType;

  JobModel({
    required this.title,
    required this.location,
    required this.price,
    required this.status,
    required this.date,
    required this.timeSlot,
    required this.packageType,
  });
}
