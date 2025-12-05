import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 350.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: Color(0xffC40000), width: 1.w),
        ),
        child: Text(
          tr.cancelSearch,
          style: AppTextStyle.textStyle(
            appFontSize: 18.sp,
            appFontWeight: FontWeight.w400,
            color: Color(0xffC40000),
          ),
        ),
      ),
    );
  }
}
