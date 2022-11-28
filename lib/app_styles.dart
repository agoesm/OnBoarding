import 'package:flutter/material.dart';
import 'size_config.dart';

const Color kPurpleColor = Color(0xff5041ff);
const Color kYellowColor = Color(0xffFFB41C);
const Color kDarkWhiteColor = Color(0xffEBEDF1);
const Color kBlackColor = Color(0xff172B4D);
const Color kLightBlackColor = Color(0xff434f65);

final kTitleOnBoarding = TextStyle(
  fontSize: SizeConfig.blockSizeHorizontal! * 7,
  fontWeight: FontWeight.bold,
  color: kBlackColor,
);
final kSubtitleOnBoarding = TextStyle(
  fontSize: SizeConfig.blockSizeHorizontal! * 4,
  color: kLightBlackColor,
);
final kTextButton = TextStyle(
  fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
  color: kPurpleColor,
);
