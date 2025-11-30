import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBodyApp extends StatelessWidget {
  const CustomBodyApp({super.key, this.child, this.top = 0, this.bottom = 0});
  final Widget? child;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 20.w,
        right: 20.w,
        top: top,
        bottom: bottom,
      ),
      child: child,
    );
  }
}
