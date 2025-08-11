import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/constance/strings/strings.dart';
import 'package:nftmarketplace/featrues/home/view/widgets/floating_botton.dart';
import 'package:nftmarketplace/featrues/home/view/widgets/horizontal_image_card_list.dart';
import 'package:nftmarketplace/featrues/home/view/widgets/top_saller_card.dart';
import 'package:nftmarketplace/featrues/home/view/widgets/trinding_image_card_list.dart';
import 'package:nftmarketplace/featrues/states/ui/screen/statess_creen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff211134),
      floatingActionButton: PolygonFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45.r),
          topRight: Radius.circular(45.r),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
          child: Container(
            height: 70.h,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white, size: 30.sp),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.stacked_bar_chart,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 300),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    StatesScreen(),
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) => FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 35.w),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person_2_outlined,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

                // Positioned(
                //   bottom: 65.h,
                //   child: FloatingActionButton(
                //     onPressed: () {},
                //     child: Container(color: Colors.white),
                //   ),
                //   // ClipRRect(
                //   //   borderRadius: BorderRadius.circular(30.r),
                //   //   child: BackdropFilter(
                //   //     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                //   //     child: Container(
                //   //       width: 70.w,
                //   //       height: 70.h,
                //   //       decoration: BoxDecoration(
                //   //         color: Colors.white.withOpacity(0.08),
                //   //         border: Border.all(
                //   //           color: Colors.white.withOpacity(0.2),
                //   //           width: 1,
                //   //         ),
                //   //         borderRadius: BorderRadius.circular(30.r),
                //   //       ),
                //   //       child: Icon(Icons.favorite, color: Colors.white),
                //   //     ),
                //   //   ),
                //   // ),
                // ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Small vertical space at the top
                12.verticalSpace,

                // Main title of the home screen
                Text(
                  HomeStrings.homeTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // Space between the title and the horizontal list
                20.verticalSpace,

                // A list of Trinding displayed on the HomeScreen.
                HorizontalImageCardList(),
                28.verticalSpace,

                // Trending collections
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Trending collections",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                8.verticalSpace,
                TrendingImageCardList(),
                28.verticalSpace,

                // Top Saller collections
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top seller",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                8.verticalSpace,

                // A list of category items Top Saller  on the HomeScreen.
                TopSallerCard(),
                70.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
