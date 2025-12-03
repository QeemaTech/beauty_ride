import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class DisplayNotification extends StatelessWidget {
  const DisplayNotification({
    super.key,
    required this.title,
    required this.subTitle,
    required this.date,
  });
  final String title;
  final String subTitle;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Color(0xff263040),
        border: Border.all(color: Color(0xff394760), width: 1),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          SvgPicture.asset(IconsResources.notification),
          Column(
            children: [
              SizedBox(
                width: 260.w,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textStyle(
                    appFontSize: 14.sp,
                    appFontWeight: FontWeight.w700,
                    color: Color(0xffEFF1F5),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              SizedBox(
                width: 250.w,
                child: Text(
                  subTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textStyle(
                    appFontSize: 12.sp,
                    appFontWeight: FontWeight.w500,
                    color: Color(0xffEFF1F5),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SizedBox(width: 200.w),
                  Text(
                    textAlign: TextAlign.right,
                    date,

                    style: AppTextStyle.textStyle(
                      appFontSize: 12.sp,
                      appFontWeight: FontWeight.w400,
                      color: Color(0xff9FADC6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
