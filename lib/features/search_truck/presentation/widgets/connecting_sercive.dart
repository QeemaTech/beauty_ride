import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class ConnectingSercive extends StatelessWidget {
  const ConnectingSercive({super.key, required this.icon, required this.onTap});
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffE4C6C6).withOpacity(0.40),
        ),
        child: SvgPicture.asset(icon, width: 20.w, height: 20.h),
      ),
    );
  }
}
