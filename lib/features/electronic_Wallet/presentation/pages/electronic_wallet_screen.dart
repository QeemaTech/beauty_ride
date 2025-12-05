import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElectronicWalletScreen extends StatelessWidget {
  const ElectronicWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Section (Dark Blue)
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 50.h,
              left: 20.w,
              right: 20.w,
              bottom: 30.h,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF1A237E), // Dark blue color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top buttons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          context.pop();
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    // Info button
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.info_outline, color: Colors.black),
                        onPressed: () {
                          // TODO: Show info dialog
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                GiveSpace(height: 24),
                // Wallet Balance Title
                Text(
                  'Wallet Balance', // tr.walletBalance
                  style: AppTextStyle.textStyle(
                    appFontSize: 16.sp,
                    appFontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                GiveSpace(height: 8),
                // Balance Amount
                Text(
                  '${tr.egp} 24.83',
                  style: AppTextStyle.textStyle(
                    appFontSize: 32.sp,
                    appFontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                GiveSpace(height: 16),
                // View wallet statement
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to wallet statement
                  },
                  child: Row(
                    children: [
                      Text(
                        'View wallet statement', // tr.viewWalletStatement
                        style: AppTextStyle.textStyle(
                          appFontSize: 14.sp,
                          appFontWeight: FontWeight.w400,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
                GiveSpace(height: 24),
                // Add funds button
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        'Add funds', // tr.addFunds
                        style: AppTextStyle.textStyle(
                          appFontSize: 16.sp,
                          appFontWeight: FontWeight.w600,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Cards Section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GiveSpace(height: 20),
                  // Cards header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cards', // tr.cards
                        style: AppTextStyle.textStyle(
                          appFontSize: 20.sp,
                          appFontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigate to add card screen
                        },
                        child: Text(
                          'Add +', // '${tr.add} +'
                          style: AppTextStyle.textStyle(
                            appFontSize: 16.sp,
                            appFontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GiveSpace(height: 20),
                  // Visa Card
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
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
                        // Visa logo
                        Container(
                          width: 50.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF1A237E),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'VISA',
                              style: AppTextStyle.textStyle(
                                appFontSize: 12.sp,
                                appFontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        // Card info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Visa', // tr.visa
                                style: AppTextStyle.textStyle(
                                  appFontSize: 16.sp,
                                  appFontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Container(
                                    width: 8.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Container(
                                    width: 8.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Container(
                                    width: 8.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Container(
                                    width: 8.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    '1234',
                                    style: AppTextStyle.textStyle(
                                      appFontSize: 14.sp,
                                      appFontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Edit button
                        PrimaryButton(
                          title: tr.edit,
                          onPressed: () {
                            // TODO: Navigate to edit card screen
                          },
                          color: Colors.white,
                          style: AppTextStyle.textStyle(
                            appFontSize: 14.sp,
                            appFontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Security message
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.verified_user,
                          color: Color(0xFF1A237E),
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Your payment info is stored securely', // tr.yourPaymentInfoStoredSecurely
                          style: AppTextStyle.textStyle(
                            appFontSize: 12.sp,
                            appFontWeight: FontWeight.w400,
                            color: Colors.grey[600],
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
        ],
      ),
    );
  }
}
