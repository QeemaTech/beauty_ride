import 'package:beauty_ride/core/functions/check_current_lang.dart';
import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/features/search/presentation/widgets/display_common_titles.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
List<String> getWords() {
  return [
    tr.massage,
    tr.nails,
    tr.skinTreatment,
  ];
} 


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppbar(title: tr.search),
      ),
      body: CustomBodyApp(
        child: Column(
          children: [
            CustomTextFormField(
              isBorder: true,
              hintText: tr.search,
              image: IconsResources.search,
            ),
            GiveSpace(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr.latest,
                  style: AppTextStyle.textStyle(
                    appFontSize: 14.sp,
                    appFontWeight: FontWeight.w400,
                    color: Color(0xff999999),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    tr.clearAll,
                    style: AppTextStyle.textStyle(
                      appFontSize: 14.sp,
                      appFontWeight: FontWeight.w400,
                      color: Color(0xff8A4242),
                    ),
                  ),
                ),
              ],
            ),
            GiveSpace(height: 19),
            ...List.generate(getWords().length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15.h),
                    child: Text(
                      getWords()[index],
                      style: AppTextStyle.textStyle(
                        appFontSize: 14.sp,
                        appFontWeight: FontWeight.w400,
                        color: Color(0xff110808),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    IconsResources.close,
                    width: 16.w,
                    height: 16.h,
                  ),
                ],
              );
            }),
            GiveSpace(height: 16),
            Align(
              alignment: isArabic
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                tr.popularSearch,
                style: AppTextStyle.textStyle(
                  appFontSize: 16.sp,
                  appFontWeight: FontWeight.w400,
                  color: Color(0xff8A4242),
                ),
              ),
            ),
            GiveSpace(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                spacing: 40.w,
                children: [
                  DisplayCommonTitles(title: tr.dye),
                  DisplayCommonTitles(title: tr.nails),
                  DisplayCommonTitles(title: tr.haircut),
                ],
              ),
            ),
            GiveSpace(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                spacing: 40.w,
                children: [
                  DisplayCommonTitles(title: tr.hairstyles),
                  DisplayCommonTitles(title: tr.skinCare),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
