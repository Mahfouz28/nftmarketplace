import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/constance/images/app_images.dart';
import 'package:nftmarketplace/constance/strings/strings.dart';
import 'package:nftmarketplace/featrues/onboarding/ui/widgets/glass_card.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
          children: [
            //  Gradient overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFB6BDD0), Color(0xFF5C609B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            //  Background image (start halfway outside screen)
            Image.asset(
              AppImages.onboardingImage,
              width: double.infinity,

              fit: BoxFit.cover,
            ),

            //  Foreground content
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
                    Spacer(),
                    Flexible(child: GlassCard()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
