import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../shared/extentions/navigations.dart';
import '../../../shared/resources/icons_resources.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.title = "",
    this.isActionIcon = true,
    this.isNotification = false,
    this.isBack = true,
  });
  final String title;
  final bool isActionIcon;
  final bool isNotification;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyle.textStyle(
          appFontSize: 16.sp,
          appFontWeight: FontWeight.w700,
          color: Color(0xffDFE4EC),
        ),
      ),
      leading: isBack
          ? GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: SvgPicture.asset(
                  IconsResources.arrowLeft,
                  height: 20,
                  width: 20,
                ),
              ),
            )
          : null,
      actions: [
        if (isActionIcon == true)
          GestureDetector(
            onTap: () {
              context.pushNamedAndRemoveUntil(Routes.homeScreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 26),
              child: Text(
                title,
                style: AppTextStyle.textStyle(
                  appFontSize: 16.sp,
                  appFontWeight: FontWeight.w500,
                  color: Color(0xffDFE4EC),
                ),
              ),
            ),
          ),
        // if (isNotification == true) NotificationIcon(),
      ],
    );
  }
}
