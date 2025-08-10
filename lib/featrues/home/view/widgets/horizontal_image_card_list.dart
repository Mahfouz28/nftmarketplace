import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalImageCardList extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"image": "assets/Art.jpg", "title": "Art"},
    {"image": "assets/arthur_party.jpg", "title": "Party"},
    {"image": "assets/spotifay.jpg", "title": "Music"},
  ];

  HorizontalImageCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  items[index]["image"]!,
                  fit: BoxFit.cover,
                  width: 255.w,
                  height: 160.h,
                ),
              ),

              // Blur only at bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.r),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.4),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Title text
              Positioned(
                bottom: 10.h,
                left: 0,
                right: 0,
                child: Text(
                  items[index]["title"]!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
