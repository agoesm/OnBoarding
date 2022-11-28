import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? seenOnBoard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  // to load onboard shared preferences for the first time
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnBoard = pref.getBool('seenOnBoard') ?? false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Onboarding',
      home: seenOnBoard == true ? const HomePage() : const OnBoardingPage(),
    );
  }
}
