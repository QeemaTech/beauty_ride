import 'package:beauty_ride/features/auth/presentation/widgets/location_permission.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OtpDialog extends StatelessWidget {
  const OtpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.maybePop();
                },
                child: SvgPicture.asset(
                  IconsResources.close,
                  width: 14.w,
                  height: 14.h,
                ),
              ),
              Text(
                "OTP",
                style: AppTextStyle.textStyle(
                  appFontSize: 18.sp,
                  appFontWeight: FontWeight.w700,
                  color: Color(0xff8A4242),
                ),
              ),
              Container(),
            ],
          ),

          GiveSpace(height: 16),

          // Subtitle
          Text(
            "لقد أرسلنا رمزاً مكوناً من 6 أرقام إلى رقم هاتفك +965••••1234",
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyle(
              appFontSize: 14.sp,
              color: Color(0xff666666),
              appFontWeight: FontWeight.w400,
            ),
          ),
          GiveSpace(height: 23),

          // OTP Fields
          OtpTextField(
            showFieldAsBox: true,
            numberOfFields: 6,
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: Color(0xff8A4242),
            ),
            // borderColor: Color(0xffE6E6E6),
            enabledBorderColor: Color(0xff8A4242),
            //disabledBorderColor: Color(0xffE6E6E6),//Color(0xffE6E6E6),//Color(0xffFDFFFE),
            focusedBorderColor: Color(0xff8A4242),
            borderWidth: 1,
            borderRadius: BorderRadius.circular(8.r),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here if necessary
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {},
          ),

          GiveSpace(height: 23),

          // Timer
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "لم تستلم الرمز؟ ",
                  style: AppTextStyle.textStyle(
                    appFontSize: 14.sp,
                    appFontWeight: FontWeight.w400,
                    color: Color(0xff666666),
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // context.pushNamedAndRemoveUntil(Routes.login);
                    },
                  text: "أعد الإرسال خلال 30 ثانية",
                  style: AppTextStyle.textStyle(
                    appFontSize: 14.sp,
                    appFontWeight: FontWeight.w400,
                    color: Color(0xff8A4242),
                  ),
                ),
              ],
            ),
          ),

          GiveSpace(height: 16),
          // Confirm Button
          PrimaryButton(
            title: "تأكيد",
            onPressed: () {
              context.push(LocationPermissionSheet());
            },
          ),
        ],
      ),
    );
  }
}
