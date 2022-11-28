import 'package:flutter/material.dart';
import 'package:onboarding/app_styles.dart';

class OnBoardingNavButton extends StatelessWidget {
  const OnBoardingNavButton({
    super.key,
    required this.onPressed,
    required this.name,
    required this.buttonColor,
  });

  final VoidCallback? onPressed;
  final String name;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(name, style: kTextButton.copyWith(color: buttonColor)),
      ),
    );
  }
}
