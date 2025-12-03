import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/home/presentation/widgets/view_service.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/features/service_screen/presentation/cubit/service_screen_cubit.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

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
    return BlocProvider(
      create: (context) => ServiceScreenCubit(),
      child: BlocBuilder<ServiceScreenCubit, ServiceScreenState>(
        builder: (context, state) {
          final cubit = context.read<ServiceScreenCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: CustomAppbar(title: tr.ourServices),
            ),
            body: CustomBodyApp(
              child: Column(
                children: [
                  // Search Bar
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.searchScreen);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        border: Border.all(
                          color: Color(0xff8A4242),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconsResources.search,
                            width: 20.w,
                            height: 20.w,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            tr.search,
                            style: AppTextStyle.textStyle(
                              appFontSize: AppFontSize.textSM,
                              appFontWeight: AppFontWeight.regular,
                              color: Color(0xff999999),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GiveSpace(height: 24),
                  // Services Grid
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: cubit.services.length,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
