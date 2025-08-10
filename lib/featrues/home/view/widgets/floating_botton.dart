import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolygonFab extends StatelessWidget {
  const PolygonFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {},
      child: ClipPath(
        clipper: PolygonClipper(sides: 6),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
          child: Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.08)),
            child: Icon(Icons.add, color: Colors.white, size: 26.sp),
          ),
        ),
      ),
    );
  }
}

class PolygonClipper extends CustomClipper<Path> {
  final int sides;

  PolygonClipper({this.sides = 6});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double angle = (2 * Math.pi) / sides;
    final double radius = size.width / 2;

    for (int i = 0; i <= sides; i++) {
      final double x = radius + radius * Math.cos(i * angle - Math.pi / 2);
      final double y = radius + radius * Math.sin(i * angle - Math.pi / 2);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
