import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDefaultContainer extends StatelessWidget {
  const CustomDefaultContainer({
    super.key,
    this.child,
    this.padding,
    this.color, this.margin,
  });
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: color ?? Color(0xff263040),
        border: Border.all(color: Color(0xff394760), width: 1.w),
      ),
      child: child,
    );
  }
}
