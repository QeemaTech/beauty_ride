import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/features/insurance_cards/presentation/cubit/insurance_cards_cubit.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:beauty_ride/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsuranceCardsScreen extends StatelessWidget {
  const InsuranceCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InsuranceCardsCubit(),
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(50.h),
        //   child: CustomAppbar(
        //     title: tr.insuranceCards,
        //   ),
        // ),
        body: BlocBuilder<InsuranceCardsCubit, InsuranceCardsState>(
          builder: (context, state) {
            final cubit = context.read<InsuranceCardsCubit>();

            if (state is InsuranceCardsLoaded) {
              return CustomBodyApp(
                child: Column(
                  children: [
                    Expanded(
                      child: state.cards.isEmpty
                          ? _buildEmptyState()
                          : ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              itemCount: state.cards.length,
                              itemBuilder: (context, index) {
                                final card = state.cards[index];
                                return _buildInsuranceCard(
                                  context: context,
                                  card: card,
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
                        title: tr.addInsuranceCard,
                        onPressed: () {
                          _showAddCardDialog(context, cubit);
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
          Icon(Icons.credit_card_off, size: 80.sp, color: Color(0xff999999)),
          GiveSpace(height: 16),
          Text(
            tr.noInsuranceCardsSaved,
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

  Widget _buildInsuranceCard({
    required BuildContext context,
    required InsuranceCardModel card,
    required InsuranceCardsCubit cubit,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF8A4242), Color(0xFF8A4242).withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
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
                    Icons.health_and_safety,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    card.companyName,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textMD,
                      appFontWeight: AppFontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (card.isDefault) ...[
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        tr.defaultText,
                        style: AppTextStyle.textStyle(
                          appFontSize: AppFontSize.textXS,
                          appFontWeight: AppFontWeight.medium,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onSelected: (value) {
                  if (value == 'edit') {
                    _showEditCardDialog(context, cubit, card);
                  } else if (value == 'delete') {
                    _showDeleteConfirmationDialog(context, cubit, card.id);
                  } else if (value == 'setDefault') {
                    cubit.setDefaultCard(card.id);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'setDefault',
                    child: Text(tr.setAsDefault),
                  ),
                  PopupMenuItem(value: 'edit', child: Text(tr.edit)),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text(tr.delete, style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ],
          ),
          GiveSpace(height: 24),
          if (card.holderName != null) ...[
            Text(
              tr.cardHolder,
              style: AppTextStyle.textStyle(
                appFontSize: AppFontSize.textXS,
                appFontWeight: AppFontWeight.regular,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              card.holderName!,
              style: AppTextStyle.textStyle(
                appFontSize: AppFontSize.textMD,
                appFontWeight: AppFontWeight.bold,
                color: Colors.white,
              ),
            ),
            GiveSpace(height: 16),
          ],
          Text(
            tr.cardNumber,
            style: AppTextStyle.textStyle(
              appFontSize: AppFontSize.textXS,
              appFontWeight: AppFontWeight.regular,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            card.cardNumber,
            style: AppTextStyle.textStyle(
              appFontSize: AppFontSize.textLG,
              appFontWeight: AppFontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          GiveSpace(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.expiryDate,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textXS,
                      appFontWeight: AppFontWeight.regular,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    card.expiryDate,
                    style: AppTextStyle.textStyle(
                      appFontSize: AppFontSize.textSM,
                      appFontWeight: AppFontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddCardDialog(BuildContext context, InsuranceCardsCubit cubit) {
    // TODO: Navigate to full add card screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr.addInsuranceCard),
        content: Text(tr.addInsuranceCardScreen),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(tr.ok),
          ),
        ],
      ),
    );
  }

  void _showEditCardDialog(
    BuildContext context,
    InsuranceCardsCubit cubit,
    InsuranceCardModel card,
  ) {
    // TODO: Navigate to edit card screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr.edit),
        content: Text(tr.editInsuranceCardScreen),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(tr.ok),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(
    BuildContext context,
    InsuranceCardsCubit cubit,
    String cardId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr.delete),
        content: Text(tr.areYouSureDeleteCard),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(tr.cancel),
          ),
          TextButton(
            onPressed: () {
              cubit.deleteCard(cardId);
              Navigator.pop(context);
            },
            child: Text(tr.delete, style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
