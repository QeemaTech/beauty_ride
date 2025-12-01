import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewService extends StatelessWidget {
  const ViewService({super.key, required this.title, required this.icon});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        Image.asset(icon, width: 40.w, height: 40.h),
        Text(
          title,
          style: AppTextStyle.textStyle(
            appFontSize: 14.sp,
            appFontWeight: FontWeight.w400,
            color: Color(0xff110808),
          ),
        ),
      ],
    );
  }
}
