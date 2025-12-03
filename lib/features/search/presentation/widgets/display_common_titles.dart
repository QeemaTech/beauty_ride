import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCommonTitles extends StatelessWidget {
  const DisplayCommonTitles({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.textStyle(
        appFontSize: 12.sp,
        appFontWeight: FontWeight.w400,
        color: Color(0xff8A4242),
      ),
    );
  }
}
