import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/generated/l10n.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.location,
    required this.address,
    this.onNotificationTap,
    this.onMenuTap,
    this.onSearchTap,
  });

  final String location;
  final String address;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onMenuTap;
  final VoidCallback? onSearchTap;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onNotificationTap,
                child: SvgPicture.asset(
                  IconsResources.notification,
                  width: 24.w,
                  height: 24.w,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    IconsResources.location2,
                    width: 20.w,
                    height: 20.w,
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location,
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textMD,
                          appFontWeight: AppFontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        address,
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textXS,
                          appFontWeight: AppFontWeight.regular,
                          color: Colors.grey[600]!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: onMenuTap,
                child: SvgPicture.asset(
                  IconsResources.menu,
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: onSearchTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600], size: 20.sp),
                  SizedBox(width: 12.w),
                  Text(
                    s.search,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textSM,
                      appFontWeight: AppFontWeight.regular,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

