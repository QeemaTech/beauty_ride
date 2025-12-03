import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ViewService extends StatelessWidget {
  const ViewService({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 8.h,
        children: [
          SvgPicture.asset(icon, width: 40.w, height: 40.h),
          Text(
            title,
            style: AppTextStyle.textStyle(
              appFontSize: 14.sp,
              appFontWeight: FontWeight.w400,
              color: Color(0xff110808),
            ),
          ),
        ],
      ),
    );
  }
}
