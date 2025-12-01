import 'package:beauty_ride/features/home/presentation/widgets/display_more.dart';
import 'package:beauty_ride/features/home/presentation/widgets/view_service.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beauty_ride/features/home/presentation/cubit/home_cubit.dart';
import 'package:beauty_ride/features/home/presentation/widgets/home_header_widget.dart';
import 'package:beauty_ride/features/home/presentation/widgets/home_banner_widget.dart';
import 'package:beauty_ride/features/home/presentation/widgets/service_item_widget.dart';
import 'package:beauty_ride/features/home/presentation/widgets/most_requested_service_card.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: CustomBodyApp(
          child: SingleChildScrollView(
            child: Column(
              children: [
              Image.asset(ImagesResources.ads),
                GiveSpace(height: 24),
                DisplayMore(title: 'خدماتنا', displayMore: 'المزيد'),
                GiveSpace(height: 8),
                Row(
                  spacing: 16.w,
                  children: [
                    ViewService(
                      title: 'تنضيف بشرة',
                      icon: ImagesResources.face,
                    ),
                    ViewService(
                      title: 'تنضيف بشرة',
                      icon: ImagesResources.face,
                    ),
                    ViewService(
                      title: 'تنضيف بشرة',
                      icon: ImagesResources.face,
                    ),
                    ViewService(
                      title: 'تنضيف بشرة',
                      icon: ImagesResources.face,
                    ),
                  ],
                ),
                GiveSpace(height: 16),
                Row(
                  spacing: 16.w,
                  children: [
                    ViewService(
                      title: 'تنضيف بشرة',
                      icon: ImagesResources.face,
                    ),
                    ViewService(
                      title: 'تنضيف بشرة',
                      icon: ImagesResources.face,
                    ),
                    ViewService(
                      title: 'تنضيف بشرة',
                      icon: ImagesResources.face,
                    ),
                    ViewService(
                      title: 'تنضيف بشرة',
                      icon: ImagesResources.face,
                    ),
                  ],
                ),
                GiveSpace(height: 23),
                DisplayMore(title: 'اكثر الخدمات طلبا', displayMore: 'المزيد'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, HomeLoaded state) {
    final s = S.of(context);
    final cubit = context.read<HomeCubit>();

    // Service icons mapping - you'll need to add these icons to your assets
    final serviceIcons = {
      'wax': IconsResources.b1,
      'massage': IconsResources.b2,
      'manicure': IconsResources.b3,
      'skinCleansing': IconsResources.b4,
      'dye': IconsResources.b1,
      'spa': IconsResources.b2,
      'makeup': IconsResources.b3,
      'haircut': IconsResources.b4,
    };

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          HomeHeaderWidget(
            location: state.location,
            address: state.address,
            onNotificationTap: () {
              // TODO: Navigate to notifications
            },
            onMenuTap: () {
              // TODO: Open menu drawer
            },
            onSearchTap: () {
              // TODO: Navigate to search
            },
          ),

          // Banner
          HomeBannerWidget(image: ImagesResources.bg),

          // Services Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  s.ourServices,
                  style: AppTextStyle.textStyle(
                    appFontSize: AppFontSize.textLG,
                    appFontWeight: AppFontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to all services
                  },
                  child: Text(
                    s.more,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textSM,
                      appFontWeight: AppFontWeight.medium,
                      color: Color(0xFFE4C6C6),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Services Grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.85,
              ),
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                final service = state.services[index];
                String serviceKey = service.name;

                // Get translation
                String serviceName = '';
                switch (serviceKey) {
                  case 'wax':
                    serviceName = s.wax;
                    break;
                  case 'massage':
                    serviceName = s.massage;
                    break;
                  case 'manicure':
                    serviceName = s.manicure;
                    break;
                  case 'skinCleansing':
                    serviceName = s.skinCleansing;
                    break;
                  case 'dye':
                    serviceName = s.dye;
                    break;
                  case 'spa':
                    serviceName = s.spa;
                    break;
                  case 'makeup':
                    serviceName = s.makeup;
                    break;
                  case 'haircut':
                    serviceName = s.haircut;
                    break;
                  default:
                    serviceName = serviceKey;
                }

                return ServiceItemWidget(
                  icon: serviceIcons[serviceKey] ?? IconsResources.b1,
                  title: serviceName,
                  onTap: () {
                    // TODO: Navigate to service details
                  },
                );
              },
            ),
          ),

          SizedBox(height: 24.h),

          // Most Requested Services Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  s.mostRequestedServices,
                  style: AppTextStyle.textStyle(
                    appFontSize: AppFontSize.textLG,
                    appFontWeight: AppFontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to all most requested services
                  },
                  child: Text(
                    s.more,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textSM,
                      appFontWeight: AppFontWeight.medium,
                      color: Color(0xFFE4C6C6),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Most Requested Services List
          SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: state.mostRequestedServices.length,
              itemBuilder: (context, index) {
                final service = state.mostRequestedServices[index];
                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: MostRequestedServiceCard(
                    image: service.image,
                    discount: service.discount,
                    isFavorite: service.isFavorite,
                    onTap: () {
                      // TODO: Navigate to service details
                    },
                    onFavoriteTap: () {
                      cubit.toggleFavorite(service.id);
                    },
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
