import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:beauty_ride/features/saved_addresses/presentation/cubit/saved_addresses_cubit.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedaddressesScreen extends StatelessWidget {
  const SavedaddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedAddressesCubit(),
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
       
        body: BlocBuilder<SavedAddressesCubit, SavedAddressesState>(
          builder: (context, state) {
            final cubit = context.read<SavedAddressesCubit>();

            if (state is SavedAddressesLoaded) {
              return CustomBodyApp(
                child: Column(
                  children: [
                    Expanded(
                      child: state.addresses.isEmpty
                          ? _buildEmptyState()
                          : ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              itemCount: state.addresses.length,
                              itemBuilder: (context, index) {
                                final address = state.addresses[index];
                                return _buildAddressCard(
                                  context: context,
                                  address: address,
                                  cubit: cubit,
                                );
                              },
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: PrimaryButton(
                        title: 'إضافة عنوان جديد',
                        onPressed: () {
                          // TODO: Navigate to add address screen
                          _showAddAddressDialog(context, cubit);
                        },
                        color: Color(0xFF8A4242),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off,
            size: 80.sp,
            color: Color(0xff999999),
          ),
          GiveSpace(height: 16),
          Text(
            'لا توجد عناوين محفوظة',
            style: AppTextStyle.textStyle(
              appFontSize: AppFontSize.textMD,
              appFontWeight: AppFontWeight.medium,
              color: Color(0xff999999),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard({
    required BuildContext context,
    required SavedAddressModel address,
    required SavedAddressesCubit cubit,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xFF8A4242),
                    size: 24.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    address.title,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textMD,
                      appFontWeight: AppFontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  if (address.isDefault) ...[
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Color(0xFF8A4242).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        'افتراضي',
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textXS,
                          appFontWeight: AppFontWeight.medium,
                          color: Color(0xFF8A4242),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: Color(0xff666666)),
                onSelected: (value) {
                  if (value == 'edit') {
                    _showEditAddressDialog(context, cubit, address);
                  } else if (value == 'delete') {
                    _showDeleteConfirmationDialog(context, cubit, address.id);
                  } else if (value == 'setDefault') {
                    cubit.setDefaultAddress(address.id);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'setDefault',
                    child: Text('تعيين كافتراضي'),
                  ),
                  PopupMenuItem(
                    value: 'edit',
                    child: Text('تعديل'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('حذف', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ],
          ),
          GiveSpace(height: 12),
          Text(
            address.address,
            style: AppTextStyle.textStyle(
              appFontSize: AppFontSize.textSM,
              appFontWeight: AppFontWeight.regular,
              color: Color(0xff666666),
            ),
          ),
          if (address.buildingNumber != null ||
              address.floor != null ||
              address.apartment != null) ...[
            GiveSpace(height: 8),
            Row(
              children: [
                if (address.buildingNumber != null)
                  _buildDetailChip('مبنى ${address.buildingNumber}'),
                if (address.floor != null) ...[
                  SizedBox(width: 8.w),
                  _buildDetailChip('طابق ${address.floor}'),
                ],
                if (address.apartment != null) ...[
                  SizedBox(width: 8.w),
                  _buildDetailChip('شقة ${address.apartment}'),
                ],
              ],
            ),
          ],
          GiveSpace(height: 12),
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage(ImagesResources.map),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.location_on,
                color: Color(0xFF8A4242),
                size: 30.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        text,
        style: AppTextStyle.textStyle(
          appFontSize: AppFontSize.textXS,
          appFontWeight: AppFontWeight.regular,
          color: Color(0xff666666),
        ),
      ),
    );
  }

  void _showAddAddressDialog(BuildContext context, SavedAddressesCubit cubit) {
    // TODO: Navigate to full add address screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('إضافة عنوان جديد'),
        content: Text('سيتم إضافة شاشة إضافة عنوان جديدة قريباً'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('موافق'),
          ),
        ],
      ),
    );
  }

  void _showEditAddressDialog(
    BuildContext context,
    SavedAddressesCubit cubit,
    SavedAddressModel address,
  ) {
    // TODO: Navigate to edit address screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('تعديل العنوان'),
        content: Text('سيتم إضافة شاشة تعديل العنوان قريباً'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('موافق'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(
    BuildContext context,
    SavedAddressesCubit cubit,
    String addressId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('حذف العنوان'),
        content: Text('هل أنت متأكد من حذف هذا العنوان؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              cubit.deleteAddress(addressId);
              Navigator.pop(context);
            },
            child: Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
