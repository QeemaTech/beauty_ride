import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 35.w,
                height: 35.w,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: AppTextStyle.textStyle(
              appFontSize: AppFontSize.textSM,
              appFontWeight: AppFontWeight.medium,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


