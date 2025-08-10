import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/constance/screens/screens.dart';
import 'package:nftmarketplace/featrues/home/view/screen/home_screen.dart';
import 'package:nftmarketplace/featrues/onboarding/ui/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(351, 760),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppScreens.onboarding,
          routes: {
            AppScreens.onboarding: (context) => const OnboardingScreen(),
            AppScreens.home: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
