import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../classes/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final void Function()? onTap;
  final void Function()? suffixIconOnTap;
  //final ValueChanged<String> valueChanged;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final String image;
  final void Function()? onPressed;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool isName;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final int? maxLines;
  final int? minLines;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onTap,
    this.icon,
    this.obscureText,
    //required this.valueChanged,
    this.suffixIconOnTap,
    this.suffixIcon,
    this.image = "",
    this.onPressed,
    this.prefixIcon,
    this.keyboardType,
    this.isName = false,
    this.onChanged,
    this.hintStyle,
    this.maxLines = 1,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        obscureText: obscureText == null || obscureText == false ? true : false,
        validator: (value) {
          if (value!.isEmpty) {
            return "please entre this text field";
          } else {
            return null;
          }
        },
        controller: controller,
        // onFieldSubmitted: (value) {
        //   return valueChanged(value);
        // },
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            right: 12.w,
            left: 12.w,
            top: 10.h,
            bottom: 10.h,
          ),
          hintStyle:
              hintStyle ??
              AppTextStyle.textStyle(
                appFontSize: 14.sp,
                appFontWeight: FontWeight.w500,
                color: Color(0xff8092B3),
              ),
          suffixIcon: IconButton(
            onPressed: suffixIconOnTap,
            icon: Icon(suffixIcon, color: Colors.black),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xff394760)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xff394760)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xff394760)),
          ),
          fillColor: Color(0xff263040),
          filled: true,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: image.isNotEmpty || image != ""
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: SvgPicture.asset(image, height: 18.h, width: 18.w),
                )
              : prefixIcon,
        ),
      ),
    );
  }
}
