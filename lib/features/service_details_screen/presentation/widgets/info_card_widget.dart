import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.onTap,
    this.icon,
  });

  final String title;
  final String value;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.textStyle(
                appFontSize: AppFontSize.textSM,
                appFontWeight: AppFontWeight.regular,
                color: Color(0xff999999),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: AppTextStyle.textStyle(
                          cairo: true,
                          appFontSize: AppFontSize.textLG,
                          appFontWeight: AppFontWeight.bold,
                          color: Color(0xff110808),
                        ),
                      ),
                      if (subtitle != null) ...[
                        SizedBox(height: 4.h),
                        Text(
                          subtitle!,
                          style: AppTextStyle.textStyle(
                            appFontSize: AppFontSize.textXS,
                            appFontWeight: AppFontWeight.regular,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (onTap != null)
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Color(0xff8A4242).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: SvgPicture.asset(
                        IconsResources.edit,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: ColorFilter.mode(
                          Color(0xff8A4242),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        // Row(
        //   children: [
        //     if (icon != null) ...[icon!, SizedBox(width: 12.w)],
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             title,
        //             style:AppTextStyle.textStyle(
        //               appFontSize: 16.sp,
        //               appFontWeight: FontWeight.w400,
        //               color: Color(0xff8A4242),
        //             ),
        //           ),
        //           SizedBox(height: 4.h),
        //           Text(
        //             value,
        //             style: AppTextStyle.textStyle(
        //               appFontSize: 16.sp,
        //               appFontWeight: FontWeight.w400,
        //               color: Color(0xff110808),
        //             ),
        //           ),
        //           if (subtitle != null) ...[
        //             SizedBox(height: 4.h),
        //             Text(
        //               subtitle!,
        //               style: AppTextStyle.textStyle(
        //                 appFontSize: AppFontSize.textXS,
        //                 appFontWeight: AppFontWeight.regular,
        //                 color: Color(0xff999999),
        //               ),
        //             ),
        //           ],
        //         ],
        //       ),
        //     ),
        //     if (onTap != null)
        //       GestureDetector(
        //         onTap: onTap,
        //         child: SvgPicture.asset(
        //           IconsResources.edit,
        //           width: 16.w,
        //           height: 16.h,
        //         ),
        //       ),
        //     // Icon(
        //     //   Icons.chevron_left,
        //     //   color: Color(0xff999999),
        //     //   size: 20.sp,
        //     // ),
        //   ],
        // ),
      ),
    );
  }
}
