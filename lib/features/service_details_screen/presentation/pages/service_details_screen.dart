import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/cubit/service_details_screen_cubit.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/widgets/custom_dropdown_field.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/color_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dropdown options
    final hairLengthOptions = [
      tr.lessThan50cm,
      tr.hairLength50to70,
      tr.hairLength70to90,
      tr.hairLengthMoreThan90,
    ];

    final dyeTypeOptions = [tr.americanImportedLocal, tr.european, tr.asian];

    final dyeColorOptions = [
      tr.burgundyRed,
      tr.brown,
      tr.black,
      tr.blonde,
      tr.otherColors,
    ];

    return BlocProvider(
      create: (context) => ServiceDetailsScreenCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppbar(title: tr.serviceDetails, isBack: true),
        ),
        body: BlocBuilder<ServiceDetailsScreenCubit, ServiceDetailsScreenState>(
          builder: (context, state) {
            final cubit = context.read<ServiceDetailsScreenCubit>();

            if (state is ServiceDetailsScreenLoaded) {
              return CustomBodyApp(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GiveSpace(height: 24),

                      // Hair Length Dropdown
                      CustomDropdownField(
                        label: tr.hairLength,
                        items: hairLengthOptions,
                        selectedValue: state.selectedHairLength,
                        hint: tr.lessThan50cm,
                        onChanged: (value) {
                          cubit.updateHairLength(value);
                        },
                      ),

                      GiveSpace(height: 24),

                      // Dye Type Dropdown
                      CustomDropdownField(
                        label: tr.dyeType,
                        items: dyeTypeOptions,
                        selectedValue: state.selectedDyeType,
                        hint: tr.americanImportedLocal,
                        onChanged: (value) {
                          cubit.updateDyeType(value);
                        },
                      ),

                      GiveSpace(height: 24),

                      // Dye Color Dropdown
                      CustomDropdownField(
                        label: tr.dyeColor,
                        items: dyeColorOptions,
                        selectedValue: state.selectedDyeColor,
                        hint: tr.burgundyRed,
                        onChanged: (value) {
                          cubit.updateDyeColor(value);
                        },
                      ),

                      GiveSpace(height: 24),

                      // Additional Notes
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.additionalNotes,
                            style: AppTextStyle.textStyle(
                              appFontSize: AppFontSize.textMD,
                              appFontWeight: AppFontWeight.medium,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              // border: Border.all(
                              //   color: Color(0xff8A4242),
                              //   width: 1.w,
                              // ),
                            ),
                            child: TextField(
                              controller: TextEditingController(
                                text: state.additionalNotes,
                              ),
                              maxLines: 5,
                              minLines: 5,
                              onChanged: (value) {
                                cubit.updateAdditionalNotes(value);
                              },
                              style: AppTextStyle.textStyle(
                                appFontSize: AppFontSize.textSM,
                                appFontWeight: AppFontWeight.regular,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: tr.allergicToHydrogenPeroxide,
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
                        ],
                      ),

                      GiveSpace(height: 40),

                      // Next Button
                      Center(
                        child: PrimaryButton(
                          title: tr.next,
                          onPressed: () {
                            cubit.submitForm();
                            context.pushNamed(Routes.serviceDetailsScreenPart2);
                          },
                          color: ColorResources.primaryColor,
                        ),
                      ),

                      GiveSpace(height: 24),
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
