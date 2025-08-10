import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalImageCardList extends StatelessWidget {
  // List containing image paths and their corresponding titles
  final List<Map<String, String>> items = [
    {"image": "assets/Art.jpg", "title": "Art"},
    {"image": "assets/arthur_party.jpg", "title": "Party"},
    {"image": "assets/spotifay.jpg", "title": "Music"},
  ];

  HorizontalImageCardList({super.key});
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 170.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        scrollDirection: Axis.horizontal, // Display items horizontally
        itemCount: items.length, // Total number of items
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

              // Title text placed at the bottom center of the image
              Positioned(
                bottom: 10.h, // Distance from the bottom
                left: 0,
                right: 0,
                child: Text(
                  items[index]["title"]!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      // Shadow to make the text stand out against the image
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Center text horizontally
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
