import 'package:beauty_ride/core/functions/check_current_lang.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/language/presentation/cubit/language_cubit.dart';
import 'package:beauty_ride/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:beauty_ride/generated/l10n.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/widgets/primary_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return Scaffold(
            body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
              builder: (context, state) {
                final cubit = context.read<OnBoardingCubit>();
                final tr = S.of(context);
                final onBoardings = cubit.getOnBoardings(context);
                return PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: cubit.controller,
                  onPageChanged: (index) {
                    cubit.changePage(index);
                  },
                  itemCount: onBoardings.length,
                  itemBuilder: (_, index) {
                    final onBoard = onBoardings[index];
                return Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(onBoard.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: CustomBodyApp(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        if(index !=3)
                        GestureDetector(
                          onTap: () {
                            context.pushReplacementNamed(Routes.login);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 40.h,
                            ),
                            child: Align(
                              alignment: isArabic
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: Text(
                                tr.next,
                                style: AppTextStyle.textStyle(
                                  appFontSize: 18.sp,
                                  appFontWeight: FontWeight.w400,
                                  color: Color(0xff683131),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          textAlign: TextAlign.center,
                          onBoard.title,
                          style: AppTextStyle.textStyle(
                            appFontSize: 24,
                            appFontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        GiveSpace(height: 9),
                        Text(
                          textAlign: TextAlign.center,
                          onBoard.subTitle,
                          style: AppTextStyle.textStyle(
                            appFontSize: 16,
                            appFontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        GiveSpace(height: 32),
                        index == 3
                            ? Column(
                                spacing: 16.h,
                                children: [
                                  PrimaryButton(
                                    title: tr.user,
                                    onPressed: () {
                                      context.pushReplacementNamed(
                                        Routes.login,
                                      );
                                    },
                                  ),
                                  PrimaryButton(
                                    title: tr.serviceProvider,
                                    onPressed: () {
                                      context.pushReplacementNamed(
                                        Routes.signUp,
                                      );
                                    },
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: tr.signInAs,
                                          style: AppTextStyle.textStyle(
                                            appFontSize: 16.sp,
                                            appFontWeight: FontWeight.w400,
                                            color: Color(0xffFFFFFF),
                                          ),
                                        ),
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.pushNamedAndRemoveUntil(
                                                Routes.dashboard,
                                              );
                                            },
                                          text: tr.guest,
                                          style: AppTextStyle.textStyle(
                                            appFontSize: 16.sp,
                                            appFontWeight: FontWeight.w400,
                                            color: Color(0xff683131),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : PrimaryButton(
                                title: tr.next,
                                onPressed: () {
                                  cubit.nextPage(onBoardings.length);
                                },
                              ),
                        GiveSpace(height: 16),
                        if (index != 3)
                          SmoothPageIndicator(
                            controller: cubit.controller, // PageController
                            count: onBoardings.length - 1,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Color(0xff683131),
                              dotColor: Color(0xffF9FAFA),
                            ), // your preferred effect
                            onDotClicked: (index) {},
                          ),
                        GiveSpace(height: 50),
                      ],
                    ),
                  ),
                );
              },
            );
              },
            ),
          );
        },
      ),
    );
  }
}
