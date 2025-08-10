import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/featrues/states/ui/widgets/header.dart';

class StatesScreen extends StatelessWidget {
  const StatesScreen({super.key});

  // Sample data for the ranking list
  final List<Map<String, dynamic>> rankingData = const [
    {
      'name': 'Azumi',
      'value': '200055.02',
      'percentage': '3.99%',
      'color': Colors.teal,
      'isPositive': true,
    },
    {
      'name': 'Hape prime',
      'value': '180055.45',
      'percentage': '33.79%',
      'color': Colors.purple,
      'isPositive': true,
    },
    {
      'name': 'Cryoto',
      'value': '90055.62',
      'percentage': '-6.56%',
      'color': Colors.green,
      'isPositive': false,
    },
    {
      'name': 'Ape Club',
      'value': '88055.12',
      'percentage': '3.99%',
      'color': Colors.brown,
      'isPositive': true,
    },
    {
      'name': 'Bat',
      'value': '10055.06',
      'percentage': '3.99%',
      'color': Colors.blue,
      'isPositive': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff211134),
        body: SafeArea(
          child: Column(
            children: [
              // Custom header widget
              Header(),

              // TabBar
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 0.5,
                    ),
                  ),
                ),
                child: TabBar(
                  indicatorWeight: 2,
                  indicatorColor: const Color(0xff97A9F6),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bar_chart, size: 20),
                          SizedBox(width: 6),
                          Text("Ranking"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.show_chart, size: 20),
                          SizedBox(width: 6),
                          Text("Activity"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Filter Section
              Container(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  children: [
                    // All categories dropdown
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff2A1A3E),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.apps,
                                  color: Colors.grey,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "All categories",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    // All Chains dropdown
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff2A1A3E),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.3),
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.link,
                                  color: Colors.grey,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "All Chains",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // TabBarView with Expanded to fill remaining space
              Expanded(
                child: TabBarView(
                  children: [
                    // First tab content: Ranking list
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xff2A1A3E).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsets.all(16.r),
                        itemCount: rankingData.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          final item = rankingData[index];
                          return Container(
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              color: const Color(0xff362347).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              children: [
                                // Rank number
                                Container(
                                  width: 24.w,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                // Avatar/Image
                                Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: item['color'],
                                    borderRadius: BorderRadius.circular(8.r),
                                    gradient: LinearGradient(
                                      colors: [
                                        item['color'],
                                        item['color'].withOpacity(0.7),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                // Name and view info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        "view info",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Value and percentage
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "₿ ${item['value']}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      item['percentage'],
                                      style: TextStyle(
                                        color: item['isPositive']
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // Second tab content: Activity
                    Center(
                      child: Text(
                        "Activity",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
