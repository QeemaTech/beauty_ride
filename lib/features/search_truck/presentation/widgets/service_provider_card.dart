import 'package:beauty_ride/core/functions/profile_widget.dart';
import 'package:beauty_ride/features/search_truck/data/models/service_provider_model.dart';
import 'package:beauty_ride/generated/l10n.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceProviderCard extends StatelessWidget {
  final ServiceProviderModel provider;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const ServiceProviderCard({
    super.key,
    required this.provider,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        spacing: 16.h,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                child: Image.asset(ImagesResources.man),
              ),
              GiveSpace(height: 9),
              Column(
                spacing: 5.h,
                children: [
                  Text(
                    provider.name,
                    style: AppTextStyle.textStyle(
                      appFontSize: 12.sp,
                      appFontWeight: FontWeight.w400,
                      color: Color(0xff110808),
                    ),
                  ),
                  Row(
                    spacing: 5.w,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        provider.rating.toStringAsFixed(1),
                        style: AppTextStyle.textStyle(
                          appFontSize: 10.sp,
                          appFontWeight: FontWeight.w400,
                          color: Color(0xff110808),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Text(
                '${provider.price.toInt()} ${tr.egp}',
                style: AppTextStyle.textStyle(
                  appFontSize: 16.sp,
                  appFontWeight: FontWeight.w400,
                  color: Color(0xff110808),
                ),
              ),
            ],
          ),
        ],
      ),
      // Column(
      //   children: [
      //     Row(
      //       children: [
      //         // Price
      //         Container(
      //           width: 80.w,
      //           child: Text(
      //             '${provider.price.toInt()} ${tr.egp}',
      //             style: AppTextStyle.textStyle(
      //               appFontSize: 18.sp,
      //               appFontWeight: FontWeight.w600,
      //               color: Color(0xff8A4242),
      //             ),
      //           ),
      //         ),
      //         SizedBox(width: 12.w),
      //         // Provider Info
      //         Expanded(
      //           child: Row(
      //             children: [
      //               // Profile Image
      //               ClipRRect(
      //                 borderRadius: BorderRadius.circular(30.r),
      //                 child: Container(
      //                   width: 50.w,
      //                   height: 50.h,
      //                   child: profileWidget(imageUrl: provider.imageUrl),
      //                 ),
      //               ),
      //               SizedBox(width: 12.w),
      //               // Name and Rating
      //               Expanded(
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       provider.name,
      //                       style: AppTextStyle.textStyle(
      //                         appFontSize: 16.sp,
      //                         appFontWeight: FontWeight.w600,
      //                         color: Colors.black,
      //                       ),
      //                     ),
      //                     SizedBox(height: 4.h),
      //                     Row(
      //                       children: [
      //                         Icon(
      //                           Icons.star,
      //                           color: Colors.amber,
      //                           size: 16.sp,
      //                         ),
      //                         SizedBox(width: 4.w),
      //                         Text(
      //                           provider.rating.toStringAsFixed(1),
      //                           style: AppTextStyle.textStyle(
      //                             appFontSize: 14.sp,
      //                             appFontWeight: FontWeight.w400,
      //                             color: Colors.black87,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //     SizedBox(height: 12.h),
      //     // Action Buttons
      //     Row(
      //       children: [
      //         // Reject Button
      //         Expanded(
      //           child: GestureDetector(
      //             onTap: onReject,
      //             child: Container(
      //               padding: EdgeInsets.symmetric(vertical: 12.h),
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.circular(8.r),
      //                 border: Border.all(color: Color(0xffC40000), width: 1.w),
      //               ),
      //               child: Center(
      //                 child: Text(
      //                   tr.reject,
      //                   style: AppTextStyle.textStyle(
      //                     appFontSize: 16.sp,
      //                     appFontWeight: FontWeight.w600,
      //                     color: Color(0xffC40000),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(width: 12.w),
      //         // Accept Button
      //         Expanded(
      //           child: GestureDetector(
      //             onTap: onAccept,
      //             child: Container(
      //               padding: EdgeInsets.symmetric(vertical: 12.h),
      //               decoration: BoxDecoration(
      //                 color: Color(0xff8A4242),
      //                 borderRadius: BorderRadius.circular(8.r),
      //               ),
      //               child: Center(
      //                 child: Text(
      //                   tr.accept,
      //                   style: AppTextStyle.textStyle(
      //                     appFontSize: 16.sp,
      //                     appFontWeight: FontWeight.w600,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
