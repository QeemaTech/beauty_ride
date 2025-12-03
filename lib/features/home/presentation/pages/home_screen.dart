import 'package:beauty_ride/core/classes/responsive_screen.dart';
import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/home/presentation/cubit/home_cubit.dart';
import 'package:beauty_ride/features/home/presentation/widgets/display_more.dart';
import 'package:beauty_ride/features/home/presentation/widgets/view_service.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  String _getServiceTranslation(String serviceKey) {
    switch (serviceKey) {
      case 'wax':
        return tr.wax;
      case 'massage':
        return tr.massage;
      case 'manicure':
        return tr.manicure;
      case 'skinCleansing':
        return tr.skinCleansing;
      case 'dye':
        return tr.dye;
      case 'spa':
        return tr.spa;
      case 'makeup':
        return tr.makeup;
      case 'haircut':
        return tr.haircut;
      case 'pedicure':
        return tr.pedicure;
      case 'nailCare':
        return tr.nailCare;
      case 'hairstyles':
        return tr.hairstyles;
      case 'skinTreatment':
        return tr.skinTreatment;
      case 'hairTreatment':
        return tr.hairTreatment;
      case 'colorCoordination':
        return tr.colorCoordination;
      case 'moroccanBath':
        return tr.moroccanBath;
      default:
        return serviceKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initialize();
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            body: CustomBodyApp(
              top: 20.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(ImagesResources.ads),
                    GiveSpace(height: 24),
                    DisplayMore(
                      title: tr.ourServices,
                      displayMore: tr.more,
                      onTap: () {
                        context.pushNamed(Routes.serviceScreen);
                      },
                    ),
                    GiveSpace(height: 8),
                    // Services Grid
                    SizedBox(
                      height: 180.h,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: cubit.services.length > 7 ? 8 : 0,
                        itemBuilder: (context, index) {
                          final service = cubit.services[index];
                          final translatedTitle = _getServiceTranslation(
                            service.title,
                          );
                          return ViewService(
                            icon: service.icon,
                            title: translatedTitle,
                            onTap: () {
                              context.pushNamed(Routes.serviceDetailsScreen);
                            },
                          );
                        },
                      ),
                    ),
                    GiveSpace(height: 24),
                    DisplayMore(
                      title: tr.mostRequestedServices,
                      displayMore: tr.more,
                      onTap: () {
                        context.pushNamed(Routes.serviceScreen);
                      },
                    ),
                    //GiveSpace(height: 24),
                    SizedBox(
                      height: 200.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25.r),
                                bottomLeft: Radius.circular(25.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25.r),
                                    bottomLeft: Radius.circular(25.r),
                                  ),
                                  child: Image.asset(
                                    cubit.requests[index].image,
                                    width: 109.w,
                                    height: 110.h,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cubit.requests[index].title,
                                      style: AppTextStyle.textStyle(
                                        color: Color(0xff000000),
                                        appFontSize: 12.sp,
                                        appFontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    GiveSpace(width: 10.w),
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff8A4242),
                                      ),
                                      child: SvgPicture.asset(
                                        IconsResources.add,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, indesx) => GiveSpace(width: 10.w),
                        itemCount: cubit.requests.length,
                      ),
                    ),
                    DisplayMore(
                      title: tr.mostRequestedServices,
                      displayMore: tr.more,
                      onTap: () {
                        context.pushNamed(Routes.serviceScreen);
                      },
                    ),
                    SizedBox(
                      height: 200.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25.r),
                                bottomLeft: Radius.circular(25.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25.r),
                                    bottomLeft: Radius.circular(25.r),
                                  ),
                                  child: Image.asset(
                                    cubit.requests[index].image,
                                    width: 109.w,
                                    height: 110.h,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cubit.requests[index].title,
                                      style: AppTextStyle.textStyle(
                                        color: Color(0xff000000),
                                        appFontSize: 12.sp,
                                        appFontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    GiveSpace(width: 10.w),
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff8A4242),
                                      ),
                                      child: SvgPicture.asset(
                                        IconsResources.add,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, indesx) => GiveSpace(width: 10.w),
                        itemCount: cubit.requests.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
