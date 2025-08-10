import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingImageCardList extends StatefulWidget {
  const TrendingImageCardList({super.key});

  @override
  State<TrendingImageCardList> createState() => _TrendingImageCardListState();
}

class _TrendingImageCardListState extends State<TrendingImageCardList> {
  final List<Map<String, String>> items = [
    {"image": "assets/3D art.jpg", "title": "3D Art"},
    {"image": "assets/abstract art.jpg", "title": "Abstract Art"},
    {"image": "assets/portrait art.jpg", "title": "Portrait Art"},
  ];

  late List<bool> favorites;

  @override
  void initState() {
    super.initState();
    favorites = List<bool>.filled(items.length, false);
  }

  void toggleFavorite(int index) {
    setState(() {
      favorites[index] = !favorites[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 195.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                    0.1,
                  ), // translucent background for blur effect
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image area with padding & background blur
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Stack(
                          children: [
                            // Background blur layer behind image
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                width: double.infinity,
                                height: 134.h,
                                color: Colors.white.withOpacity(0.08),
                              ),
                            ),
                            // Actual image
                            Image.asset(
                              items[index]["image"]!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 134.h,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Title + Favorite button area
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[index]["title"]!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                            ),
                            onPressed: () => toggleFavorite(index),
                            icon: Icon(
                              favorites[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: favorites[index]
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            label: const Text('200'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
