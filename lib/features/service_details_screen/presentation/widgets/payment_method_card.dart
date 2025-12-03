import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.title,
    required this.selectedMethod,
    this.onTap,
  });

  final String title;
  final String selectedMethod;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textSM,
                      appFontWeight: AppFontWeight.regular,
                      color: Color(0xff999999),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.account_balance_wallet,
                          color: Colors.green,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        selectedMethod,
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textMD,
                          appFontWeight: AppFontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_left,
              color: Color(0xff999999),
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}




