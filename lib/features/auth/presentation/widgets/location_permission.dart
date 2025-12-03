import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

/// Call this using:
/// showModalBottomSheet(
///   context: context,
///   backgroundColor: Colors.transparent,
///   isScrollControlled: true,
///   builder: (_) => const LocationPermissionSheet(),
/// );

class LocationPermissionSheet extends StatelessWidget {
  const LocationPermissionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      width: double.infinity,
      // decoration:  BoxDecoration(color: Colors.transparent),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     alignment: Alignment.topCenter,
      //     image: AssetImage(ImagesResources.map),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: .min,
        children: [
          // Map Pin Icon
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(image: AssetImage(ImagesResources.map)),
            ),
            child: Center(
              child: SvgPicture.asset(IconsResources.currentLocation),
            ),
          ),

          // const SizedBox(height: 18),
          Text(
            tr.beautyRideNeedsLocationAccess,
            style: AppTextStyle.textStyle(
              appFontSize: 16.sp,
              appFontWeight: FontWeight.w400,
              color: Color(0xff666666),
            ),
            textAlign: TextAlign.center,
          ),

          GiveSpace(height: 16),

          // Allow Button
          PrimaryButton(title: tr.allowLocationAccess, onPressed: () {
            context.pushNamedAndRemoveUntil(Routes.dashboard);
          }),

          GiveSpace(height: 16),
          // Deny
          GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text(
              tr.dontAllow,
              style: AppTextStyle.textStyle(
                appFontSize: 14.sp,
                appFontWeight: FontWeight.w400,
                color: Color(0xff666666),
              ),
            ),
          ),

          GiveSpace(height: 16),
        ],
      ),
    );
  }
}
