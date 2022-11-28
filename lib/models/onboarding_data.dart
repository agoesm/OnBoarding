class OnBoarding {
  String title;
  String subtitle;
  String image;

  OnBoarding({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnBoarding> onboardingContent = [
  OnBoarding(
      title: 'Get notified when work happens',
      subtitle:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
      image: 'assets/onboarding1.svg'),
  OnBoarding(
      title: 'Stay organized with project and team',
      subtitle:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
      image: 'assets/onboarding2.svg'),
  OnBoarding(
      title: 'Create tasks and assign them ',
      subtitle:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
      image: 'assets/onboarding3.svg'),
  OnBoarding(
      title: 'Track your work Get results!',
      subtitle:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
      image: 'assets/onboarding4.svg'),
];
