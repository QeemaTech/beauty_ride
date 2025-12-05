import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/core/functions/check_current_lang.dart';
import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/myBookings/presentation/cubit/mybookings_cubit.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/widgets/service_chip_widget.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

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
      create: (context) => MybookingsCubit(),
      child: BlocConsumer<MybookingsCubit, MybookingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = context.read<MybookingsCubit>();
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: CustomAppbar(title: tr.booking),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  SizedBox(
                    width: 250.w,
                    child: PrimaryButton(
                      title: tr.confirmPayment,
                      onPressed: () {
                        // Save the screen context before showing dialog
                        final screenContext = context;
                        // context.pushNamed(Routes.searchTruckScreen);
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              child: Container(
                                height: 300.h,
                                // width: 350.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 24.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Color(0xffFFFCFE),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      IconsResources.correct,
                                      width: 100.w,
                                      height: 100.h,
                                    ),
                                    GiveSpace(height: 16),
                                    Text(
                                      tr.paymentSuccessful,
                                      style: AppTextStyle.textStyle(
                                        appFontSize: 16.sp,
                                        appFontWeight: FontWeight.w400,
                                        color: Color(0xff171717),
                                      ),
                                    ),
                                    GiveSpace(height: 8),
                                    Text(
                                      tr.bookingConfirmed,
                                      style: AppTextStyle.textStyle(
                                        appFontSize: 14.sp,
                                        appFontWeight: FontWeight.w400,
                                        color: Color(0xff999999),
                                      ),
                                    ),
                                    GiveSpace(height: 16),
                                    PrimaryButton(
                                      title: tr.backToHome,
                                      onPressed: () {
                                        // Close dialog first
                                        Navigator.of(dialogContext).pop();
                                        // Navigate using root navigator after dialog closes
                                        Future.microtask(() {
                                          if (navigatorKey.currentContext != null) {
                                            navigatorKey.currentContext!
                                                .pushNamedAndRemoveUntil(
                                              Routes.dashboard,
                                            );
                                          } else {
                                            // Fallback: use screen context
                                            screenContext.pushNamedAndRemoveUntil(
                                              Routes.dashboard,
                                            );
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    spacing: 10.w,
                    children: [
                      SvgPicture.asset(
                        IconsResources.moneys,
                        width: 20.w,
                        height: 20.h,
                      ),
                      Text(
                        "500 ج.م",
                        style: AppTextStyle.textStyle(
                          inter: true,
                          appFontSize: 16.sp,
                          appFontHeight: 26.sp,
                          appFontWeight: FontWeight.w400,
                          color: Color(0xff8A4242),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: CustomBodyApp(
              child: Column(
                children: [
                  Align(
                    alignment: isArabic
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      tr.requiredServices,
                      style: AppTextStyle.textStyle(
                        appFontSize: 18.sp,
                        appFontWeight: FontWeight.w400,
                        color: Color(0xff8A4242),
                      ),
                    ),
                  ),
                  GiveSpace(height: 16),
                  Row(
                    children: [
                      // ...state.selectedServices.map((service) {
                      //   return Padding(
                      //     padding: EdgeInsets.only(left: 12.w),
                      //     child: Column(
                      //       children: [
                      //         ServiceChipWidget(
                      //           icon: service.icon,
                      //           title: _getServiceTranslation(service.name),
                      //           onRemove: () {
                      //             //cubit.removeService(service.id);
                      //           },
                      //         ),
                      //         SizedBox(height: 20.h),
                      //       ],
                      //     ),
                      //   );
                      // }),
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
                                    // cubit.addService(
                                    //   SelectedService(
                                    //     id: service.id.toString(),
                                    //     name: service.title,
                                    //     icon: service.icon,
                                    //   ),
                                    // );
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class BookingScreen extends StatelessWidget {
//   const BookingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "الخدمات المطلوبة",
//           style: TextStyle(color: Colors.brown),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// SERVICES ROW
//             Row(spacing: 16.w, children: [_serviceItem(), _serviceItem()]),

//             SizedBox(height: 24.h),

//             /// BOOKING COMMITMENT BOX
//             Container(
//               padding: EdgeInsets.all(16.w),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 6,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     "جدية حجز",
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.brown,
//                     ),
//                   ),
//                   SizedBox(height: 8.h),
//                   Text(
//                     "300 ج.م",
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 30.h),

//             /// PAYMENT TITLE
//             Text(
//               "اختر طريقة الدفع",
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.brown,
//               ),
//             ),
//             SizedBox(height: 16.h),

//             /// PAYMENT OPTIONS
//             _paymentOption(
//               selected: true,
//               label: "ماستر كارد",
//               icon: Image.network(
//                 "https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg",
//                 width: 32,
//               ),
//             ),

//             SizedBox(height: 12.h),

//             _paymentOption(
//               selected: false,
//               label: "ماستر كارد",
//               icon: Row(
//                 children: [
//                   Image.network(
//                     "https://upload.wikimedia.org/wikipedia/commons/5/5f/Apple_Pay_logo.svg",
//                     width: 40,
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 12.h),

//             _paymentOption(
//               selected: false,
//               label: "فيزا",
//               icon: Image.network(
//                 "https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg",
//                 width: 40,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// SERVICE ITEM WIDGET
//   Widget _serviceItem() {
//     return Column(
//       children: [
//         Container(
//           width: 65.w,
//           height: 65.h,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: const Color(0xFFF8EDED),
//           ),
//           child: Center(
//             child: Icon(
//               Icons.face_retouching_natural,
//               size: 32.sp,
//               color: Colors.brown,
//             ),
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           "قص شعر",
//           style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//         ),
//       ],
//     );
//   }

//   /// PAYMENT OPTION WIDGET
//   Widget _paymentOption({
//     required bool selected,
//     required String label,
//     required Widget icon,
//   }) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.r),
//         color: selected ? const Color(0xFFE9E6F8) : Colors.white,
//         border: Border.all(
//           color: selected ? Colors.transparent : Colors.grey.shade300,
//         ),
//         boxShadow: selected
//             ? [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 6,
//                   offset: const Offset(0, 2),
//                 ),
//               ]
//             : [],
//       ),
//       child: Row(
//         children: [
//           Icon(
//             selected
//                 ? Icons.radio_button_checked
//                 : Icons.radio_button_unchecked,
//             color: Colors.brown,
//           ),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Text(
//               label,
//               style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
//             ),
//           ),
//           icon,
//         ],
//       ),
//     );
//   }
// }
