import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../shared/widgets/primary_button.dart';
import '../widgets/custom_appbar.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppbar(isBack: false),
        ),
        body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: cubit.controller,
              onPageChanged: (index) {
                cubit.changePage(index);
              },
              itemCount: cubit.onBoardings.length,
              itemBuilder: (_, index) {
                final onBoard = cubit.onBoardings[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      // TextStyleApp(
                      //   textAlign: TextAlign.center,
                      //   text: onBoard.nameApp,
                      //   fontSize: 59,
                      //   fontWeight: FontWeight.w400,
                      //   color: Color(0xff2F9D8C),
                      // ),
                      // SizedBox(height: 48),
                      // TextStyleApp(
                      //   text: onBoard.title,
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.bold,
                      //   color: Color(0xffEFF1F5),
                      // ),
                      // SizedBox(height: 16),
                      // TextStyleApp(
                      //   textAlign: TextAlign.center,
                      //   text: onBoard.subTitle,
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.bold,
                      //   color: Color(0xffEFF1F5),
                      // ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            onBoard.image,
                            height: 20,
                            width: 24,
                          ),
                          index == 2
                              ? PrimaryButton(
                                  title: "Get Started",
                                  onPressed: () {
                                    context.pushReplacementNamed(Routes.login);
                                  },
                                )
                              : GestureDetector(
                                  onTap: () {
                                    cubit.nextPage();
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff2F9D8C),
                                          Color(0xff42A150),
                                        ],
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      IconsResources.arrowRight,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
