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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                        "انشاء حساب جديد",
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
                        "قم بإنشاء حساب  لبيوتي رايد",
                        style: AppTextStyle.textStyle(
                          color: Color(0xff666666),
                          appFontSize: 14.sp,
                          appFontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GiveSpace(height: 20),
                    Row(
                      spacing: 10.w,
                      children: [
                        Expanded(
                          child: CustomTextFormField(hintText: "الإسم الأول"),
                        ),
                        Expanded(
                          child: CustomTextFormField(hintText: "الإسم الأخير"),
                        ),
                      ],
                    ),
                    GiveSpace(height: 16),
                    CustomTextFormField(hintText: "رقم الهاتف"),
                    GiveSpace(height: 16),
                    CustomTextFormField(hintText: "البريد الإلكتروني"),
                    GiveSpace(height: 16),
                    CustomTextFormField(
                      hintText: "كلمة السر",
                      obscureText: cubit.passSignUP,
                      suffixIcon: cubit.passSignUP
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      suffixIconOnTap: () {
                        cubit.showPasswordSignUP();
                      },
                      onChanged: (value) {},
                    ),
                    GiveSpace(height: 16),
                    CustomTextFormField(
                      hintText: "تاكيد كلمة السر",
                      obscureText: cubit.passConfirmSignUP,
                      suffixIcon: cubit.passConfirmSignUP
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      suffixIconOnTap: () {
                        cubit.showConfirmPasswordSignUP();
                      },
                      onChanged: (value) {},
                    ),
                    GiveSpace(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: RadioListTile(
                            radioSide: BorderSide(color: Color(0xff8A4242)),
                            activeColor: Color(0xff8A4242),
                            contentPadding: EdgeInsets.zero,
                            value: false,
                            groupValue: cubit.radio,
                            onChanged: (newValue) {
                              cubit.selectMaleOrFimale();
                            },
                            title: Text(
                              "ذكر",
                              style: AppTextStyle.textStyle(
                                color: Color(0xff666666),
                                appFontSize: 14.sp,
                                appFontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: RadioListTile(
                            radioSide: BorderSide(color: Color(0xff8A4242)),
                            activeColor: Color(0xff8A4242),
                            contentPadding: EdgeInsets.zero,
                            value: true,
                            groupValue: cubit.radio,
                            onChanged: (newValue) {
                              cubit.selectMaleOrFimale();
                            },
                            title: Text(
                              "انثي",
                              style: AppTextStyle.textStyle(
                                color: Color(0xff110808),
                                appFontSize: 14.sp,
                                appFontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GiveSpace(height: 16),
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
                            text: "لدي حساب بالفعل؟",
                            style: AppTextStyle.textStyle(
                              appFontSize: 16.sp,
                              appFontWeight: FontWeight.w400,
                              color: Color(0xff110808),
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamedAndRemoveUntil(Routes.login);
                              },
                            text: " سجل دخول",
                            style: AppTextStyle.textStyle(
                              appFontSize: 16.sp,
                              appFontWeight: FontWeight.w400,
                              color: Color(0xff683131),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GiveSpace(height: 30),
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
