import 'package:beauty_ride/core/functions/check_current_lang.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../shared/classes/text_style.dart';
import '../../../shared/resources/color_resources.dart';

class CustomRowsDrawer extends StatelessWidget {
  const CustomRowsDrawer({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.color,
    this.isBottomBorder = true,
  });
  final String image;
  final String title;
  final void Function()? onTap;
  final Color? color;
  final bool isBottomBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: 276.w,
        decoration: BoxDecoration(
          border: isBottomBorder
              ? Border(
                  bottom: BorderSide(
                    color: ColorResources.whiteColor,
                    width: 1.w,
                  ),
                )
              : Border(
                  top: BorderSide(color: ColorResources.whiteColor, width: 1.w),
                ),
        ),
        child: Row(
          // spacing: 8.w,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorResources.whiteColor,
              ),
              child: SvgPicture.asset(image, color: Color(0xff8A4242)),
            ),
            GiveSpace(width: 5.w),
            Text(
              title,
              style: AppTextStyle.textStyle(
                appFontSize: 12.sp,
                appFontHeight: 23.sp,
                appFontWeight: FontWeight.w400,
                color: Color(0xff110808),
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              IconsResources.arrowLeft,
              height: 20.h,
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
