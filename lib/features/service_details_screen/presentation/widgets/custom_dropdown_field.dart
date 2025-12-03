import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.label,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.hint,
  });

  final String label;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.textStyle(
            appFontSize: 14.sp,
            appFontWeight: FontWeight.w400,
            color: Color(0xff110808),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
           //border: Border.all(color: Color(0xff8A4242), width: 1.w),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              hint: Text(
                hint ?? items.first,
                style: AppTextStyle.textStyle(
                  appFontSize: 14.sp,
                  appFontWeight: FontWeight.w400,
                  color: Color(0xff999999),
                ),
              ),
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff999999)),
              style: AppTextStyle.textStyle(
                appFontSize: 14.sp,
                appFontWeight: FontWeight.w400,
                color: Color(0xff999999),
              ),
              dropdownColor: Colors.white,
              onChanged: onChanged,
              items: items.map((item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
