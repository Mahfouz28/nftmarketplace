import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/constance/images/app_images.dart';
import 'package:nftmarketplace/constance/strings/strings.dart';
import 'package:nftmarketplace/featrues/onboarding/ui/widgets/glass_card.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(AppImages.onboardingImage), context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,

      body: Stack(
        children: [
          // Background image covering full screen
          Image.asset(
            AppImages.onboardingImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // Foreground content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(40.0.r),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      OnBoardingStrings.onboardingTitle,
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Flexible(child: GlassCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
