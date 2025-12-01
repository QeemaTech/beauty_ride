import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/classes/responsive_screen.dart';
import '../../../shared/resources/color_resources.dart';
import 'custom_rows_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initialize();
    return Drawer(
      width: 243.w,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: ColorResources.primaryColor),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
        ),
      ),
      backgroundColor: ColorResources.primaryColor,
      child: Container(
        padding: EdgeInsets.only(top: 50.h, left: 24.w, right: 24.w),
        constraints: BoxConstraints(
          minWidth: ResponsiveScreen.width,
          maxWidth: ResponsiveScreen.width,
          minHeight: ResponsiveScreen.height,
          maxHeight: ResponsiveScreen.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(ImagesResources.profile),
                ),
                GiveSpace(width: 10),
                Column(
                  children: [
                    Text(
                      "هبه ياسر",
                      style: AppTextStyle.textStyle(
                        color: Color(0xff110808),
                        appFontSize: 14.sp,
                        appFontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xffFFB700), size: 18),
                        Text(
                          "4.5",
                          style: AppTextStyle.textStyle(
                            color: Color(0xff110808),
                            appFontSize: 12.sp,
                            appFontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Spacer(),
                IconButton(
                  onPressed: () {
                    context.maybePop();
                  },
                  icon: Icon(Icons.close, color: Color(0xff110808)),
                ),
              ],
            ),
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                final cubit = context.read<DashboardCubit>();
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.widgets.length,
                  itemBuilder: (context, index) {
                    return CustomRowsDrawer(
                      onTap: () {
                        cubit.selectCard(index);
                      },
                      image: cubit.widgets[index].icon,
                      title: cubit.widgets[index].name,
                      color: cubit.currentIndex == index
                          ? ColorResources.whiteColor
                          : ColorResources.whiteColor.withOpacity(0.50),
                    );
                  },
                );
              },
            ),
            Spacer(),
            CustomRowsDrawer(
              onTap: () {},
              isBottomBorder: false,
              image: IconsResources.logout,
              title: tr.logout,
              color: ColorResources.blackColor,
            ),
            GiveSpace(height: 20),
            // CustomRowsDrawer(
            //   image: IconsResources.taskSquare,
            //   title: "tr.books",
            //   color: ColorResources.blackColor,
            //   onTap: () {},
            // ),
            // CustomRowsDrawer(
            //   image: IconsResources.emptyWallet,
            //   title: "tr.student",
            //   color: ColorResources.blackColor,
            // ),
            // CustomRowsDrawer(
            //   image: IconsResources.card,
            //   title: " tr.cart",
            //   color: ColorResources.blackColor,
            // ),
            // CustomRowsDrawer(
            //   image: IconsResources.location,
            //   title: " tr.profile",
            //   color: ColorResources.blackColor,
            // ),
            // CustomRowsDrawer(
            //   image: IconsResources.g2253,
            //   title: "tr.settings",
            //   color: ColorResources.blackColor,
            // ),
            // CustomRowsDrawer(
            //   image: IconsResources.group,
            //   title: "tr.settings",
            //   color: ColorResources.blackColor,
            // ),
          ],
        ),
      ),
    );
  }
}
