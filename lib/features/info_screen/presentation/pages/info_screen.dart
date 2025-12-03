import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/features/info_screen/presentation/cubit/info_screen_cubit.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:beauty_ride/shared/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  Future<void> _pickImage(BuildContext context, InfoScreenCubit cubit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      cubit.updateProfileImage(image.path);
    }
  }

  Future<void> _selectDate(BuildContext context, InfoScreenCubit cubit) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(Duration(days: 365 * 25)),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      locale: Locale('ar'),
    );
    if (picked != null) {
      cubit.updateDateOfBirth(
        '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoScreenCubit(),
      child: Scaffold(
        // backgroundColor: Color(0xFFF5F5F5),
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(50.h),
        //   child: CustomAppbar(title: tr.personalInformation),
        // ),
        body: BlocConsumer<InfoScreenCubit, InfoScreenState>(
          listener: (context, state) {
            if (state is InfoScreenSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('تم حفظ البيانات بنجاح'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<InfoScreenCubit>();

            if (state is InfoScreenLoaded) {
              return CustomBodyApp(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GiveSpace(height: 24),

                      // Profile Image Section
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 60.r,
                              backgroundImage: state.profileImage != null
                                  ? AssetImage(state.profileImage!)
                                  : AssetImage(ImagesResources.profile),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => _pickImage(context, cubit),
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8A4242),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.w,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      GiveSpace(height: 32),

                      // First Name Field
                      CustomTextFormField(
                        controller: TextEditingController(
                          text: state.firstName,
                        ),
                        hintText: tr.firstName,
                        isBorder: true,
                        onChanged: (value) {
                          cubit.updateFirstName(value);
                        },
                      ),
                      GiveSpace(height: 16),

                      // Last Name Field
                      CustomTextFormField(
                        controller: TextEditingController(text: state.lastName),
                        hintText: tr.lastName,
                        isBorder: true,
                        onChanged: (value) {
                          cubit.updateLastName(value);
                        },
                      ),
                      GiveSpace(height: 16),

                      // Email Field
                      CustomTextFormField(
                        controller: TextEditingController(text: state.email),
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
                        controller: TextEditingController(text: state.phone),
                        hintText: tr.phoneNumber,
                        keyboardType: TextInputType.phone,
                        isBorder: true,
                        onChanged: (value) {
                          cubit.updatePhone(value);
                        },
                      ),
                      GiveSpace(height: 16),

                      // Gender Selection
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: Color(0xff8A4242),
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'الجنس',
                              style: AppTextStyle.textStyle(
                                appFontSize: AppFontSize.textSM,
                                appFontWeight: AppFontWeight.medium,
                                color: Colors.black87,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => cubit.updateGender('male'),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'male',
                                    groupValue: state.gender,
                                    onChanged: (value) {
                                      if (value != null) {
                                        cubit.updateGender(value);
                                      }
                                    },
                                    activeColor: Color(0xFF8A4242),
                                  ),
                                  Text(tr.male),
                                ],
                              ),
                            ),
                            SizedBox(width: 16.w),
                            GestureDetector(
                              onTap: () => cubit.updateGender('female'),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'female',
                                    groupValue: state.gender,
                                    onChanged: (value) {
                                      if (value != null) {
                                        cubit.updateGender(value);
                                      }
                                    },
                                    activeColor: Color(0xFF8A4242),
                                  ),
                                  Text(tr.female),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GiveSpace(height: 16),

                      // Date of Birth Field
                      GestureDetector(
                        onTap: () => _selectDate(context, cubit),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Color(0xff8A4242),
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.dateOfBirth != null
                                    ? state.dateOfBirth!
                                    : 'تاريخ الميلاد',
                                style: AppTextStyle.textStyle(
                                  appFontSize: AppFontSize.textSM,
                                  appFontWeight: AppFontWeight.regular,
                                  color: state.dateOfBirth != null
                                      ? Colors.black87
                                      : Color(0xff999999),
                                ),
                              ),
                              Icon(
                                Icons.calendar_today,
                                color: Color(0xFF8A4242),
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ),

                      GiveSpace(height: 32),

                      // Save Button
                      PrimaryButton(
                        title: 'حفظ',
                        onPressed: () {
                          cubit.saveUserData();
                        },
                        color: Color(0xFF8A4242),
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
}
