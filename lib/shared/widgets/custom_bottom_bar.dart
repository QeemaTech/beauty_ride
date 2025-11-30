import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 100.h,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
          color: Color(0xff212937),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
          border: Border(
            top: BorderSide(color: Color(0xff394760), width: 1.w),
          ),
        ),
        child: PrimaryButton(title: title, onPressed: onPressed),
      ),
    );
  }
}
