import '../utils/images.dart';

class OnBoardingData {
  final String title;
  final String description;
  final String assetPath;

  OnBoardingData({
    required this.title,
    required this.description,
    required this.assetPath,
  });

  static List<OnBoardingData> onboardingPages = [
    OnBoardingData(
      title: 'One-Step Solution',
      description:
          'Find security jobs or hire professionals effortlessly all in one place!.',
      assetPath: Images.oneStepSolution,
    ),
    OnBoardingData(
      title: 'Professional Dashboard',
      description:
          'Manage job listings, applications, and security staff seamlessly from your dashboard.',
      assetPath: Images.professionalDashboard,
    ),
    OnBoardingData(
      title: 'Secure & Trackable',
      description:
          'Get real-time location updates and detailed reports for complete peace of mind.',
      assetPath: Images.secureAndTrackable,
    ),
  ];
}
