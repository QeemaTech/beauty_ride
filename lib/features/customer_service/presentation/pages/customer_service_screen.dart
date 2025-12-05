import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/features/customer_service/presentation/cubit/customer_service_cubit.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:beauty_ride/shared/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  Future<void> _launchUrl(String url) async {
    // TODO: Add url_launcher package to pubspec.yaml
    // final Uri uri = Uri.parse(url);
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri);
    // }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // TODO: Add url_launcher package to pubspec.yaml
    // final Uri uri = Uri.parse('tel:$phoneNumber');
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri);
    // }
  }

  Future<void> _sendEmail(String email) async {
    // TODO: Add url_launcher package to pubspec.yaml
    // final Uri uri = Uri.parse('mailto:$email');
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerServiceCubit(),
      child: Scaffold(
        body: BlocConsumer<CustomerServiceCubit, CustomerServiceState>(
          listener: (context, state) {
            if (state is CustomerServiceSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(tr.messageSentSuccessfully),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<CustomerServiceCubit>();

            if (state is CustomerServiceLoaded) {
              return CustomBodyApp(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GiveSpace(height: 24),

                      // Contact Information Section
                      Text(
                        tr.contactUs,
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textLG,
                          appFontWeight: AppFontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      GiveSpace(height: 16),

                      // Phone
                      _buildContactCard(
                        icon: Icons.phone,
                        title: tr.phoneNumber,
                        value: '+20 123 456 7890',
                        onTap: () => _makePhoneCall('+201234567890'),
                      ),
                      GiveSpace(height: 12),

                      // Email
                      _buildContactCard(
                        icon: Icons.email,
                        title: tr.email,
                        value: 'support@beautyride.com',
                        onTap: () => _sendEmail('support@beautyride.com'),
                      ),
                      GiveSpace(height: 12),

                      // WhatsApp
                      _buildContactCard(
                        icon: Icons.chat,
                        title: tr.whatsapp,
                        value: '+20 123 456 7890',
                        onTap: () => _launchUrl('https://wa.me/201234567890'),
                      ),

                      GiveSpace(height: 32),

                      // Contact Form Section
                      Text(
                        tr.sendMessage,
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textLG,
                          appFontWeight: AppFontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      GiveSpace(height: 16),

                      // Name Field
                      CustomTextFormField(
                        hintText: tr.firstName,
                        isBorder: true,
                        onChanged: (value) {
                          cubit.updateName(value);
                        },
                      ),
                      GiveSpace(height: 16),

                      // Email Field
                      CustomTextFormField(
                        hintText: tr.email,
                        keyboardType: TextInputType.emailAddress,
                        isBorder: true,
                        onChanged: (value) {
                          cubit.updateEmail(value);
                        },
                      ),
                      GiveSpace(height: 16),

                      // Phone Field
                      CustomTextFormField(
                        hintText: tr.phoneNumber,
                        keyboardType: TextInputType.phone,
                        isBorder: true,
                        onChanged: (value) {
                          cubit.updatePhone(value);
                        },
                      ),
                      GiveSpace(height: 16),

                      // Message Field
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: Color(0xff8A4242),
                            width: 1.w,
                          ),
                        ),
                        child: TextField(
                          maxLines: 5,
                          minLines: 5,
                          onChanged: (value) {
                            cubit.updateMessage(value);
                          },
                          style: AppTextStyle.textStyle(
                            appFontSize: AppFontSize.textSM,
                            appFontWeight: AppFontWeight.regular,
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: tr.writeYourMessage,
                            hintStyle: AppTextStyle.textStyle(
                              appFontSize: AppFontSize.textSM,
                              appFontWeight: AppFontWeight.regular,
                              color: Color(0xff999999),
                            ),
                            contentPadding: EdgeInsets.all(16.w),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      GiveSpace(height: 24),

                      // Submit Button
                      PrimaryButton(
                        title: tr.send,
                        onPressed: () {
                          cubit.submitForm();
                        },
                        color: Color(0xFF8A4242),
                      ),

                      GiveSpace(height: 32),

                      // Working Hours Section
                      Text(
                        tr.workingHours,
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textLG,
                          appFontWeight: AppFontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      GiveSpace(height: 16),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildWorkingHoursRow(
                              tr.saturdayToThursday,
                              '9:00 AM - 10:00 PM',
                            ),
                            SizedBox(height: 8.h),
                            _buildWorkingHoursRow(
                              tr.friday,
                              '2:00 PM - 10:00 PM',
                            ),
                          ],
                        ),
                      ),

                      GiveSpace(height: 40),
                    ],
                  ),
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: Color(0xFF8A4242).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: Color(0xFF8A4242), size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textSM,
                      appFontWeight: AppFontWeight.medium,
                      color: Color(0xff999999),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    value,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textMD,
                      appFontWeight: AppFontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Color(0xff999999),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkingHoursRow(String day, String hours) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: AppTextStyle.textStyle(
            appFontSize: AppFontSize.textMD,
            appFontWeight: AppFontWeight.medium,
            color: Colors.black87,
          ),
        ),
        Text(
          hours,
          style: AppTextStyle.textStyle(
            appFontSize: AppFontSize.textMD,
            appFontWeight: AppFontWeight.regular,
            color: Color(0xff666666),
          ),
        ),
      ],
    );
  }
}
