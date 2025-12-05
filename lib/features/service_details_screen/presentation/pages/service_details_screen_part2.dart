import 'package:beauty_ride/core/functions/check_current_lang.dart';
import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/cubit/service_details_screen_part2/service_details_screen_part2_cubit.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/widgets/info_card_widget.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/widgets/location_card_widget.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/widgets/custom_dropdown_field.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/widgets/service_chip_widget.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:beauty_ride/shared/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ServiceDetailsScreenPart2 extends StatelessWidget {
  const ServiceDetailsScreenPart2({super.key});

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

  String _getPaymentMethodTranslation(String methodKey) {
    switch (methodKey) {
      case 'cash':
        return tr.cash;
      case 'card':
        return isArabic ? 'بطاقة' : 'Card';
      case 'electronicWallet':
        return tr.electronicWallet;
      default:
        return tr.cash;
    }
  }

  String _getPaymentMethodKey(String translatedValue) {
    final cashAr = 'كاش';
    final cashEn = 'Cash';
    final cardAr = 'بطاقة';
    final cardEn = 'Card';

    if (translatedValue == tr.cash ||
        translatedValue == cashAr ||
        translatedValue == cashEn) {
      return 'cash';
    } else if (translatedValue == cardAr || translatedValue == cardEn) {
      return 'card';
    } else if (translatedValue == tr.electronicWallet) {
      return 'electronicWallet';
    }
    return 'cash';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceDetailsScreenPart2Cubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppbar(title: tr.serviceDetails),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 24.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffFFFCFE),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.r),
                            topRight: Radius.circular(32.r),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: .min,
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.maybePop();
                                  },
                                  child: SvgPicture.asset(IconsResources.close),
                                ),
                                Text(
                                  tr.bookLater,
                                  style: AppTextStyle.textStyle(
                                    appFontSize: 18.sp,
                                    appFontWeight: FontWeight.w400,
                                    color: Color(0xff8A4242),
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                            GiveSpace(height: 16),
                            Align(
                              alignment: isArabic
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Text(
                                tr.dateAndTime,
                                style: AppTextStyle.textStyle(
                                  appFontSize: 18.sp,
                                  appFontWeight: FontWeight.w400,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            GiveSpace(height: 16),
                            Row(
                              mainAxisAlignment: .spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 17.w,
                                    vertical: 17.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.r),
                                    color: Color(0xffF5F6F6),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconsResources.calendar,
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                      GiveSpace(width: 8),
                                      Text(
                                        tr.date,
                                        style: AppTextStyle.textStyle(
                                          appFontSize: 18.sp,
                                          appFontWeight: FontWeight.w400,
                                          appFontHeight: 22.sp,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 17.w,
                                    vertical: 17.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.r),
                                    color: Color(0xffF5F6F6),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconsResources.clock,
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                      GiveSpace(width: 8),
                                      Text(
                                        tr.time,
                                        style: AppTextStyle.textStyle(
                                          appFontSize: 18.sp,
                                          appFontWeight: FontWeight.w400,
                                          appFontHeight: 22.sp,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GiveSpace(height: 16),
                            PrimaryButton(
                              title: tr.book,
                              onPressed: () {
                                context.pushNamed(Routes.bookingScreen);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffE4C6C6),
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(IconsResources.calendar),
                ),
              ),
              SizedBox(
                width: 300.w,
                child: PrimaryButton(
                  title: tr.next,
                  onPressed: () {
                    context.pushNamed(Routes.searchTruckScreen);
                  },
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<ServiceDetailsScreenPart2Cubit, ServiceDetailsScreenPart2State>(
          builder: (context, state) {
            final cubit = context.read<ServiceDetailsScreenPart2Cubit>();

            // return CustomBodyApp(
            //   child: Column(
            //     crossAxisAlignment: .start,
            //     mainAxisAlignment: .start,
            //     children: [
            //       Text(
            //         tr.requiredServices,
            //         style: AppTextStyle.textStyle(
            //           appFontSize: 18.sp,
            //           appFontWeight: FontWeight.w400,
            //           color: Color(0xff8A4242),
            //         ),
            //       ),
            //       GiveSpace(height: 16),
            //       Row(
            //         children: [
            //           ...state.selectedServices.map((service) {
            //             return Padding(
            //               padding: EdgeInsets.only(left: 12.w),
            //               child: Column(
            //                 children: [
            //                   ServiceChipWidget(
            //                     icon: service.icon,
            //                     title: _getServiceTranslation(service.name),
            //                     onRemove: () {
            //                       cubit.removeService(service.id);
            //                     },
            //                   ),
            //                   SizedBox(height: 20.h),
            //                 ],
            //               ),
            //             );
            //           }),
            //           Padding(
            //             padding: EdgeInsets.only(left: 12.w),
            //             child: Column(
            //               children: [
            //                 ServiceChipWidget(
            //                   icon: '',
            //                   title: tr.addService,
            //                   isAddButton: true,
            //                   onAdd: () async {
            //                     final result = await context.pushNamed(
            //                       Routes.customServiceScreen,
            //                     );
            //                     if (result != null && result is List) {
            //                       // Add selected services
            //                       for (var service in result) {
            //                         cubit.addService(
            //                           SelectedService(
            //                             id: service.id.toString(),
            //                             name: service.title,
            //                             icon: service.icon,
            //                           ),
            //                         );
            //                       }
            //                     }
            //                   },
            //                 ),
            //                 SizedBox(height: 20.h),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // );
            if (state is ServiceDetailsScreenPart2Loaded) {
              return CustomBodyApp(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GiveSpace(height: 24),

                      // Required Services Section
                      Text(
                        tr.requiredServices,
                        style: AppTextStyle.textStyle(
                          appFontSize: 18.sp,
                          appFontWeight: FontWeight.w400,
                          color: Color(0xff8A4242),
                        ),
                      ),
                      GiveSpace(height: 16),
                      Row(
                        children: [
                          ...state.selectedServices.map((service) {
                            return Padding(
                              padding: EdgeInsets.only(left: 12.w),
                              child: Column(
                                children: [
                                  ServiceChipWidget(
                                    icon: service.icon,
                                    title: _getServiceTranslation(service.name),
                                    onRemove: () {
                                      cubit.removeService(service.id);
                                    },
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            );
                          }),
                          Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Column(
                              children: [
                                ServiceChipWidget(
                                  icon: '',
                                  title: tr.addService,
                                  isAddButton: true,
                                  onAdd: () async {
                                    final result = await context.pushNamed(
                                      Routes.customServiceScreen,
                                    );
                                    if (result != null && result is List) {
                                      // Add selected services
                                      for (var service in result) {
                                        cubit.addService(
                                          SelectedService(
                                            id: service.id.toString(),
                                            name: service.title,
                                            icon: service.icon,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ],
                      ),

                      GiveSpace(height: 16),

                      // Number of Service Seekers
                      InfoCardWidget(
                        title: tr.numberOfServiceSeekers,
                        value: state.numberOfServiceSeekers.toString(),
                        // icon: Padding(
                        //   padding: EdgeInsets.only(right: 8.w),
                        //   child: SvgPicture.asset(
                        //     IconsResources.taskSquare,
                        //     width: 24.w,
                        //     height: 24.w,
                        //   ),
                        // ),
                        onTap: () {
                          // TODO: Show dialog to update number
                        },
                      ),

                      GiveSpace(height: 16),

                      // Price Offer
                      InfoCardWidget(
                        title: tr.offerPriceThatSuitsYou,
                        value: state.offeredPrice != null
                            ? '${state.offeredPrice!.toInt()} ${tr.egp}'
                            : '-',
                        subtitle:
                            '${tr.recommendedFare}: ${state.recommendedPrice.toInt()} ${tr.egp}',
                        // icon: Padding(
                        //   padding: EdgeInsets.only(right: 8.w),
                        //   child: SvgPicture.asset(
                        //     IconsResources.taskSquare,
                        //     width: 24.w,
                        //     height: 24.w,
                        //   ),
                        // ),
                        onTap: () {
                          // TODO: Show dialog to update price
                        },
                      ),

                      GiveSpace(height: 16),

                      // Payment Method
                      CustomDropdownField(
                        label: tr.paymentMethod,
                        hint: isArabic
                            ? 'اختر طريقة الدفع'
                            : 'Select Payment Method',
                        selectedValue: _getPaymentMethodTranslation(
                          state.paymentMethod,
                        ),
                        items: [
                          tr.cash,
                          isArabic ? 'بطاقة' : 'Card',
                          tr.electronicWallet,
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            String paymentMethodKey = _getPaymentMethodKey(
                              value,
                            );
                            cubit.updatePaymentMethod(paymentMethodKey);
                          }
                        },
                      ),

                      GiveSpace(height: 24),

                      // Discount Code
                      Text(
                        tr.enterDiscountCode,
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textMD,
                          appFontWeight: AppFontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      GiveSpace(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 41.h,
                              child: CustomTextFormField(
                                isBorder: false,
                                hintText: tr.enterDiscountCode,
                                onChanged: (value) {
                                  cubit.updateDiscountCode(value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          MaterialButton(
                            minWidth: 95.w,
                            color: Color(0xFF8A4242),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            onPressed: () {
                              // if (state.discountCode != null && state.discountCode!.isNotEmpty) {
                              //   cubit.activateDiscountCode(state.discountCode!);
                              // }
                            },
                            child: Row(
                              spacing: 8.w,
                              children: [
                                SvgPicture.asset(
                                  IconsResources.documentCopy,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                                Text(
                                  tr.activate,
                                  style: AppTextStyle.textStyle(
                                    appFontSize: 14.sp,
                                    appFontWeight: FontWeight.w400,
                                    color: Color(0xffFDFDFD),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      GiveSpace(height: 24),

                      // Location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tr.location,
                            style: AppTextStyle.textStyle(
                              appFontSize: 16.sp,
                              appFontWeight: FontWeight.w400,
                              color: Color(0xff8A4242),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.searchTruckScreen);
                            },
                            child: Text(
                              tr.editLocation,
                              style: AppTextStyle.textStyle(
                                appFontSize: 10.sp,
                                appFontWeight: FontWeight.w400,
                                color: Color(0xFF8A4242),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GiveSpace(height: 12),
                      LocationCardWidget(
                        location: state.location,
                        address: state.address,
                        onEdit: () {
                          // TODO: Navigate to location selection
                        },
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
