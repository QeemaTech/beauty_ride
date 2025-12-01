import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.title = '',
    this.onPressed,
    this.style,
    this.isIcon,
    this.icon = '',
    this.color,
    this.widget,
  });

  final String title;
  final void Function()? onPressed;
  final TextStyle? style;
  final bool? isIcon;
  final String icon;
  final Color? color;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        //height: 54.h,
        alignment: Alignment.center,
        width: 350.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: color ?? Color(0xffE4C6C6),
          border: color != null ? Border.all(color: Color(0xffE4C6C6)) : null,
          borderRadius: BorderRadius.circular(50.r),
          // gradient: color != null
          //     ? null
          //     : LinearGradient(colors: [Color(0xff2F9D8C), Color(0xff42A150)]),
        ),
        child: isIcon != null && isIcon == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32.w,
                children: [
                  SvgPicture.asset(icon, height: 24.h, width: 24.w),
                  Text(
                    title,
                    style:style?? AppTextStyle.textStyle(
                      appFontSize: 14.sp,
                      appFontWeight: FontWeight.w700,
                      color: Color(0xffEFF1F5),
                    ),
                  ),
                ],
              )
            : widget ??
                  Text(
                    title,
                    style: AppTextStyle.textStyle(
                      appFontSize: 18.sp,
                      appFontWeight: FontWeight.w400,
                      color: Color(0xff683131),
                    ),
                  ),
      ),
    );
  }
}
