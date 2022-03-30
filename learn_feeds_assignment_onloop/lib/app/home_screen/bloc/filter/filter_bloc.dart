import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_feeds_assignment_onloop/services/api_service.dart';

import 'filter_event.dart';
import 'filter_state.dart';

/// Defines the filter bloc.
class FilterBloc extends Bloc<FilterEvents, FilterState> {
  FilterBloc({required this.service}) : super(FilterInitialState()) {
    on(_onFilterRequested);
  }

  /// The filter api service.
  final ApiService service;

  Future<void> _onFilterRequested(event, emit) async {
    try {
      emit(FilterLoading());
      final filter = await service.fetchFilterTags();
      emit(FilterLoaded(filter));
    } catch (error) {
      emit(FilterError());
    }
  }
}
