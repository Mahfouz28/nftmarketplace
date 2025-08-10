import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return        Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    45.horizontalSpace,

                    Text(
                      "Stats",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                      style: IconButton.styleFrom(foregroundColor: Colors.grey),
                    ),
                  ],
                ),
              )
; 
  }
}
