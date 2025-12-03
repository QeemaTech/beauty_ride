import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ServiceChipWidget extends StatelessWidget {
  const ServiceChipWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onRemove,
    this.isAddButton = false,
    this.onAdd,
  });

  final String icon;
  final String title;
  final VoidCallback? onRemove;
  final bool isAddButton;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    if (isAddButton) {
      return GestureDetector(
        onTap: onAdd,
        child: Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: Color(0xFFE4C6C6).withOpacity(0.3),
            //shape: BoxShape.circle,
            // border: Border.all(
            //   color: Color(0xFFE4C6C6),
            //   width: 2.w,
            // ),
          ),
          child: Icon(Icons.add, color: Color(0xFF8A4242), size: 30.sp),
        ),
      );
    }

    return Stack(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: Color(0xFFE4C6C6).withOpacity(0.3),
            // shape: BoxShape.circle,
            // border: Border.all(
            //   color: Color(0xFFE4C6C6),
            //   width: 2.w,
            // ),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 40.w,
              height: 40.w,
              colorFilter: ColorFilter.mode(Color(0xFF8A4242), BlendMode.srcIn),
            ),
          ),
        ),
        if (onRemove != null)
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(Icons.close, size: 16.sp, color: Colors.black87),
              ),
            ),
          ),
        Positioned(
          bottom: -20.h,
          left: 0,
          right: 0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyle(
              appFontSize: AppFontSize.textXS,
              appFontWeight: AppFontWeight.medium,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}



