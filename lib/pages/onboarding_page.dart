import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/app_styles.dart';
import 'package:onboarding/size_config.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:onboarding/main.dart';
import 'package:onboarding/models/onboarding_data.dart';

import './pages.dart';
import '../widgets/widgets.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      duration: const Duration(milliseconds: 400),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? kPurpleColor : kDarkWhiteColor,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
    );
  }

  Future setSeenOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnBoard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboarding page for the first time
  }

  @override
  void initState() {
    super.initState();
    // call setSeenOnboarding() here
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? sizeVertical = SizeConfig.blockSizeVertical;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingContent.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OnBoardingNavButton(
                          name: 'Skip',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          buttonColor: kPurpleColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: sizeVertical! * 1),
                  SizedBox(
                    height: sizeVertical * 50,
                    child: SvgPicture.asset(
                      onboardingContent[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: sizeVertical * 2),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        onboardingContent[index].title,
                        style: kTitleOnBoarding,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeVertical * 1),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        onboardingContent[index].subtitle,
                        style: kSubtitleOnBoarding,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeVertical * 5),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // to make dynamic views based on page position
                    currentPage == onboardingContent.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  onboardingContent.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: kYellowColor,
                                      borderRadius: BorderRadius.circular(8),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ),
                              OnBoardingNavButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                name: 'Get Started',
                                buttonColor: kYellowColor,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  onboardingContent.length,
                                  (index) => dotIndicator(index),
                                ),
                              ),
                              OnBoardingNavButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                name: 'Next',
                                buttonColor: kPurpleColor,
                              )
                            ],
                          )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
