import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';

class LocationCardWidget extends StatelessWidget {
  const LocationCardWidget({
    super.key,
    required this.location,
    required this.address,
    this.onEdit,
  });

  final String location;
  final String address;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       location,
          //       style: AppTextStyle.textStyle(
          //         appFontSize: AppFontSize.textMD,
          //         appFontWeight: AppFontWeight.bold,
          //         color: Colors.black87,
          //       ),
          //     ),
             
          //   ],
          // ),
          //SizedBox(height: 8.h),
          Text(
            address,
            style: AppTextStyle.textStyle(
              appFontSize: AppFontSize.textSM,
              appFontWeight: AppFontWeight.regular,
              color: Color(0xff666666),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage(ImagesResources.map),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.location_on,
                color: Color(0xFF8A4242),
                size: 30.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




