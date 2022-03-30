import '../../model/filter_model.dart';

/// Defines the base class for the filter states.
abstract class FilterState {}

/// Defines the initial filter state.
class FilterInitialState extends FilterState {}

/// Defines the loading filter state.
class FilterLoading extends FilterState {}

/// Defines the loaded filter state.
class FilterLoaded extends FilterState {
  FilterLoaded(this.filter);

  /// Contains the filter information.
  final FilterModel filter;
}

/// Defines the error filter state.
class FilterError extends FilterState {}
