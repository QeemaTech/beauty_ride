import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayMore extends StatelessWidget {
  const DisplayMore({
    super.key,
    required this.title,
    required this.displayMore,
    this.onTap,
  });
  final String title;
  final String displayMore;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.textStyle(
            appFontSize: 18.sp,
            appFontWeight: FontWeight.w400,
            color: Color(0xff8A4242),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            displayMore,
            style: AppTextStyle.textStyle(
              appFontSize: 12.sp,
              appFontWeight: FontWeight.w400,
              color: Color(0xff110808),
            ),
          ),
        ),
      ],
    );
  }
}
