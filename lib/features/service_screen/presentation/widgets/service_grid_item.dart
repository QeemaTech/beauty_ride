import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ServiceGridItem extends StatelessWidget {
  const ServiceGridItem({
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
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF8A4242),
                width: 2.w,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 40.w,
                height: 40.w,
                colorFilter: ColorFilter.mode(
                  Color(0xFF8A4242),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: AppTextStyle.textStyle(
              appFontSize: AppFontSize.textSM,
              appFontWeight: AppFontWeight.medium,
              color: Color(0xff110808),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

