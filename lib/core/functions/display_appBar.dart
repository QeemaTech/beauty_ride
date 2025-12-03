import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/core/functions/check_current_lang.dart';
import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/color_resources.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/textformfield.dart';
import 'package:beauty_ride/shared/widgets/titleAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

displayAppBar(int index, Widget leading) {
  switch (index) {
    case 0:
      return AppBar(
        // toolbarHeight: 120,
        leading: leading,
        toolbarHeight: 180.h,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            ImagesResources.bgAppbar,
            width: double.infinity,
            height: 100.h,
          ),
        ),
        title: Row(
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 4.w,
                    children: [
                      SvgPicture.asset(
                        IconsResources.location2,
                        width: 20.w,
                        height: 20.h,
                      ),
                      Text(
                        "القطامية",
                        style: AppTextStyle.textStyle(
                          appFontSize: 12.sp,
                          appFontWeight: FontWeight.w400,
                          color: Color(0xff110808),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "42 شارع  احمد سالم التجمع الاول",
                        style: AppTextStyle.textStyle(
                          appFontSize: 12.sp,
                          appFontWeight: FontWeight.w400,
                          color: Color(0xff666666),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigatorKey.currentContext!.pushNamed(
                            Routes.notifications,
                          );
                        },
                        child: Padding(
                          padding: isArabic
                              ? EdgeInsets.only(left: 24.w)
                              : EdgeInsets.only(right: 24.w),
                          child: SvgPicture.asset(
                            IconsResources.notification,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GiveSpace(height: 30),
                  SizedBox(
                    child: CustomTextFormField(
                      hintText: tr.search,
                      image: IconsResources.search,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    case 1:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.personalInformation),
      );
    case 2:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.myBookings),
      );
    case 3:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.electronicWallet),
      );
    case 4:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.insuranceCards),
      );
    case 5:
      // return AppBar(
      //   backgroundColor: ColorResources.primaryColor,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(50.r),
      //       bottomRight: Radius.circular(50.r),
      //     ),
      //   ),
      //   leading: leading,
      //   centerTitle: true,
      //   elevation: 0,
      //   bottom: PreferredSize(
      //     preferredSize: Size(390.w, 264.h),
      //     child: HeaderCard(),
      //   ),
      //   title: TitleAppBar(
      //     title: tr.profile,
      //     isProfile: true,
      //   ),
      // );
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.savedAddresses),
      );
    case 6:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.joinAsServiceProvider),
      );
    case 7:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.language),
      );
    case 8:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.customerService),
      );

    // default:
    //   return AppBar(
    //     title: Image.asset(ImageResources.appBarLogo),
    //     centerTitle: true,
    //     actions: [
    //       SvgPicture.asset(IconsResources.cart),
    //       SizedBox(width: 8.w),
    //       Padding(
    //         padding: isArabic
    //             ? EdgeInsets.only(left: 24.w)
    //             : EdgeInsets.only(right: 24.w),
    //         child: SvgPicture.asset(IconsResources.bell),
    //       ),
    //     ],
    //   );
  }
}
