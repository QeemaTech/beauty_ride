import 'package:beauty_ride/core/functions/display_appBar.dart';
import 'package:beauty_ride/core/functions/display_widgets.dart';
import 'package:beauty_ride/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:beauty_ride/features/dashboard/widgets/custom_drawer.dart';
import 'package:beauty_ride/shared/resources/color_resources.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<DashboardCubit, DashboardState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<DashboardCubit>();
            return Scaffold(
              key: cubit.scaffoldKey,
              drawer: CustomDrawer(),
              appBar: displayAppBar(
                cubit.currentIndex,
                GestureDetector(
                  onTap: () => cubit.scaffoldKey.currentState?.openDrawer(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: ColorResources.primaryColor,
                        // image: DecorationImage(
                        //   image: AssetImage(ImagesResources.face),
                        // ),
                      ),
                      child: SvgPicture.asset(IconsResources.menu),
                    ),
                  ),
                ),
              ),
              body: displayWidgets(cubit.currentIndex),
            );
          },
        );
      },
    );
  }
}
