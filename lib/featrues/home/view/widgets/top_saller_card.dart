import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSallerCard extends StatefulWidget {
  const TopSallerCard({super.key});

  @override
  State<TopSallerCard> createState() => _TrendingImageCardListState();
}

class _TrendingImageCardListState extends State<TopSallerCard> {
  final List<Map<String, String>> items = [
    {"image": "assets/top saller 1.jpg", "title": "3D Art"},
    {"image": "assets/top saller 2.jpg", "title": "Abstract Art"},
    {"image": "assets/top saller 3.jpg", "title": "Portrait Art"},
  ];

  // Track favorites for each item
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
    print('Favorite at index $index: ${favorites[index]}');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return Container(
            width: 170.w,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 168, 110, 235).withOpacity(.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      items[index]["image"]!,
                      fit: BoxFit.cover,
                      width: 134.w,
                      height: 134.h,
                    ),
                  ),
                ),

                // Title + Favorite button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                        ),
                        onPressed: () => toggleFavorite(index),
                        icon: Icon(
                          favorites[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favorites[index] ? Colors.red : Colors.white,
                        ),
                        label: const Text('200'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
