import 'package:beauty_ride/features/language/presentation/cubit/language_cubit.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/generated/l10n.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/color_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: CustomAppbar(title: tr.language),
      // ),
      body: CustomBodyApp(
        child: BlocConsumer<LanguageCubit, LanguageState>(
          listener: (context, state) {
            // When language is saved, show message and pop
            if (state is LanguageLoaded) {
              final locale = state.locale;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    locale.languageCode == 'ar'
                        ? 'تم تغيير اللغة بنجاح'
                        : 'Language changed successfully',
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
              // Pop after a short delay to allow user to see the change
              Future.delayed(Duration(milliseconds: 500), () {
                if (context.mounted) {
                  context.maybePop();
                }
              });
            }
          },
          builder: (context, state) {
            final cubit = context.read<LanguageCubit>();
            final currentLocale = cubit.currentLocale;
            final hasChanges = cubit.hasChanges;

            return Column(
              children: [
                GiveSpace(height: 20),
                // Arabic Option
                RadioListTile<Locale>(
                  value: const Locale('ar'),
                  groupValue: currentLocale,
                  onChanged: (Locale? value) {
                    if (value != null) {
                      cubit.selectLanguage(value);
                    }
                  },
                  activeColor: Color(0xff8A4242),
                  title: Text(
                    currentLocale.languageCode == 'ar' ? 'العربية' : 'Arabic',
                    style: AppTextStyle.textStyle(
                      appFontSize: 16.sp,
                      appFontWeight: FontWeight.w400,
                      color: Color(0xff110808),
                    ),
                  ),
                  // subtitle: Text(
                  //   'العربية',
                  //   style: AppTextStyle.textStyle(
                  //     appFontSize: 14.sp,
                  //     appFontWeight: FontWeight.w400,
                  //     color: Color(0xff666666),
                  //   ),
                  // ),
                ),
                Divider(height: 1),
                // English Option
                RadioListTile<Locale>(
                  value: const Locale('en'),
                  groupValue: currentLocale,
                  onChanged: (Locale? value) {
                    if (value != null) {
                      cubit.selectLanguage(value);
                    }
                  },
                  activeColor: Color(0xff8A4242),
                  title: Text(
                    currentLocale.languageCode == 'ar'
                        ? 'الإنجليزية'
                        : 'English',
                    style: AppTextStyle.textStyle(
                      appFontSize: 16.sp,
                      appFontWeight: FontWeight.w400,
                      color: Color(0xff110808),
                    ),
                  ),
                  // subtitle: Text(
                  //   'English',
                  //   style: AppTextStyle.textStyle(
                  //     appFontSize: 14.sp,
                  //     appFontWeight: FontWeight.w400,
                  //     color: Color(0xff666666),
                  //   ),
                  // ),
                ),
                Spacer(),
                // Save Button
                PrimaryButton(
                  title: currentLocale.languageCode == 'ar' ? 'حفظ' : 'Save',
                  onPressed: hasChanges
                      ? () {
                          cubit.saveLanguage();
                        }
                      : null,
                  color: hasChanges ? ColorResources.primaryColor : Colors.grey,
                ),
                GiveSpace(height: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}
