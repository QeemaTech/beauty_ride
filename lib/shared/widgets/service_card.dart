// import 'package:beauty_ride/core/classes/responsive_screen.dart';
// import 'package:beauty_ride/shared/widgets/give_space.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:svg_flutter/svg.dart';

// import '../classes/text_style.dart';
// import '../resources/icons_resources.dart';

// class ServiceCard extends StatelessWidget {
//   const ServiceCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//     required this.experience,
//     this.padding,
//     this.iconSubtitle = '',
//     this.category = '',
//   });

//   final String iconSubtitle;
//   final String icon;
//   final String title;
//   final String subtitle;
//   final String experience;
//   final EdgeInsetsGeometry? padding;
//   final String category;

//   @override
//   Widget build(BuildContext context) {
//     ResponsiveScreen.initialize();
//     return Container(
//       //height: 205.h,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//       margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.r),
//         color: const Color(0xff263040),
//         border: Border.all(color: const Color(0xff394760), width: 1.w),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset(icon, height: 64.h, width: 64.w),
//               SizedBox(width: 8.w),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 210.w,
//                     child: Text(
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       title,
//                       style: AppTextStyle.textStyle(
//                         appFontSize: 16.sp,
//                         appFontWeight: FontWeight.w700,
//                         color: Color(0xffEFF1F5),
//                       ),
//                     ),
//                   ),
//                   GiveSpace(height: 4),
//                   Row(
//                     spacing: 5.w,
//                     children: [
//                       Padding(
//                         padding: padding ?? EdgeInsets.zero,
//                         child: SvgPicture.asset(
//                           iconSubtitle,
//                           height: 16.h,
//                           width: 16.w,
//                         ),
//                       ),
//                       Text(
//                         subtitle,
//                         style: AppTextStyle.textStyle(
//                           appFontSize: 12.sp,
//                           appFontWeight: FontWeight.w500,
//                           color: Color(0xffEFF1F5),
//                         ),
//                       ),
//                     ],
//                   ),

//                   GiveSpace(height: 8),
//                   ConstrainedBox(
//                     constraints: BoxConstraints(
//                       maxWidth: ResponsiveScreen.width - 125,
//                       minWidth: ResponsiveScreen.width - 125,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             ...List.generate(5, (index) {
//                               return Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                                 size: 18.sp,
//                               );
//                             }),
//                           ],
//                         ),
//                         // Spacer(),
//                         //SizedBox(width: 20.w),
//                         Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 4.w,
//                             vertical: 4.h,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8.r),
//                             color: Color(0xff64D0C0),
//                           ), //! experience
//                           child: Text(
//                             experience,
//                             style: AppTextStyle.textStyle(
//                               appFontSize: 10.sp,
//                               appFontWeight: FontWeight.w500,
//                               color: Color(0xff212937),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           GiveSpace(height: 8),
//           if(category.isNotEmpty)
//           Text.rich(
//             textAlign: TextAlign.start,
//             TextSpan(
//               children: [
//                 TextSpan(
//                   text: "Mohs Scale Category: ",
//                   style: AppTextStyle.textStyle(
//                     appFontSize: 12.sp,
//                     appFontWeight: FontWeight.w500,
//                     color: Color(0xffEFF1F5),
//                   ),
//                 ),
//                 TextSpan(
//                   text: category,
//                   style: AppTextStyle.textStyle(
//                     appFontSize: 12.sp,
//                     appFontWeight: FontWeight.w500,
//                     color: Color(0xff64D0C0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Text(
//           //   experience,
//           //   style: AppTextStyle.textStyle(
//           //     appFontSize: 10.sp,
//           //     appFontWeight: FontWeight.w500,
//           //     color: Color(0xff212937),
//           //   ),
//           // ),
//           GiveSpace(height: 16),
//           DisplayInfo(icon: IconsResources.sms, text: 'sales@globalresale.com'),
//           GiveSpace(height: 4),
//           DisplayInfo(
//             icon: IconsResources.callCalling2,
//             text: '+1 (555) 987-6543',
//           ),
//           GiveSpace(height: 4),
//           DisplayInfo(
//             icon: IconsResources.global,
//             text: 'geologisticssolutions.com',
//           ),
//           GiveSpace(height: 4),
//           DisplayInfo(
//             icon: IconsResources.location,
//             text: 'Unit 5, Innovation Hub, London, UK',
//           ),
//           GiveSpace(height: 4),
//         ],
//       ),
//     );
//   }
// }
