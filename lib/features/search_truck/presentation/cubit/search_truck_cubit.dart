import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_truck_state.dart';

class SearchTruckCubit extends Cubit<SearchTruckState> {
  SearchTruckCubit() : super(SearchTruckInitial());
}
