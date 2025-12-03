import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'electronic_wallet_state.dart';

class ElectronicWalletCubit extends Cubit<ElectronicWalletState> {
  ElectronicWalletCubit() : super(ElectronicWalletInitial());
}
