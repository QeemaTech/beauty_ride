import 'package:beauty_ride/core/functions/check_current_lang.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:beauty_ride/features/auth/presentation/widgets/location_permission.dart';
import 'package:beauty_ride/features/auth/presentation/widgets/otp_dialog.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:beauty_ride/shared/widgets/textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return Scaffold(
            body: CustomBodyApp(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GiveSpace(height: 40),
                    Image.asset(
                      ImagesResources.b3,
                      height: 100.h,
                      width: 137.w,
                    ),
                    GiveSpace(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "تسجيل الدخول",
                        style: AppTextStyle.textStyle(
                          color: Color(0xff8A4242),
                          appFontSize: 18.sp,
                          appFontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GiveSpace(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "سجل دخولك لبيوتي رايد",
                        style: AppTextStyle.textStyle(
                          color: Color(0xff666666),
                          appFontSize: 14.sp,
                          appFontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GiveSpace(height: 20),
                    CustomTextFormField(hintText: "رقم الهاتف"),
                    GiveSpace(height: 16),
                    CustomTextFormField(
                      hintText: "كلمة السر",
                      obscureText: cubit.value,
                      suffixIcon: cubit.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      suffixIconOnTap: () {
                        cubit.showPasswordLogin();
                      },
                      onChanged: (value) {},
                    ),
                    GiveSpace(height: 16),
                    Align(
                      alignment: isArabic
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        "هل نسيت كلمة المرور؟",
                        style: AppTextStyle.textStyle(
                          color: Color(0xff683131),
                          appFontSize: 12.sp,
                          appFontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GiveSpace(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "او",
                        style: AppTextStyle.textStyle(
                          color: Color(0xff6B6B6B),
                          appFontSize: 14.sp,
                          appFontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GiveSpace(height: 20),
                    PrimaryButton(
                      isIcon: true,
                      color: Colors.transparent,
                      icon: IconsResources.apple,
                      title: "الاستمرار باستخدام Apple ",
                      style: AppTextStyle.textStyle(
                        appFontSize: 14.sp,
                        appFontWeight: FontWeight.w400,
                        color: Color(0xff8A4242),
                      ),
                    ),
                    GiveSpace(height: 10),
                    PrimaryButton(
                      isIcon: true,
                      color: Colors.transparent,
                      icon: IconsResources.twitter,
                      title: "الاستمرار باستخدام Apple ",
                      style: AppTextStyle.textStyle(
                        appFontSize: 14.sp,
                        appFontWeight: FontWeight.w400,
                        color: Color(0xff8A4242),
                      ),
                    ),
                    GiveSpace(height: 10),
                    PrimaryButton(
                      isIcon: true,
                      color: Colors.transparent,
                      icon: IconsResources.devicon_google,
                      title: "الاستمرار باستخدام Apple ",
                      style: AppTextStyle.textStyle(
                        appFontSize: 14.sp,
                        appFontWeight: FontWeight.w400,
                        color: Color(0xff8A4242),
                      ),
                    ),
                    GiveSpace(height: 20),
                    PrimaryButton(
                      title: "سجل الدخول",
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return LocationPermissionSheet();
                          },
                        );
                      },
                    ),
                    GiveSpace(height: 12),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "ليس لدي حساب؟ ",
                            style: AppTextStyle.textStyle(
                              appFontSize: 16.sp,
                              appFontWeight: FontWeight.w400,
                              color: Color(0xff110808),
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamedAndRemoveUntil(Routes.signUp);
                              },
                            text: "انشاء حساب",
                            style: AppTextStyle.textStyle(
                              appFontSize: 16.sp,
                              appFontWeight: FontWeight.w400,
                              color: Color(0xff683131),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GiveSpace(height: 20),
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
