import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';
import 'package:core/feature/absence/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsenceBloc extends Cubit<AbsenceState> with SafeBloc {
  AbsenceBloc({
    required this.absenceRepository,
  }) : super(const AbsenceState());

  final AbsenceRepository absenceRepository;

  /// Fetches absences from the repository and emits the new state.
  ///
  /// - [page] is used for pagination.
  /// - [loadingState] is used to handle loading differently for pagination from
  ///   the initial loading state.
  /// - [AbsenceState.selectedType] is used to filter absences by type.
  /// - [AbsenceState.selectedDate] is used to filter absences by date range.
  ///
  /// [when] is a helper function to handle different states of [DataState]
  /// and call the appropriate function based on the state. Standard BLoC
  /// implementation can be used as well. This is just for cleaner code.
  Future<void> getAbsences({
    PageInfo page = const PageInfo(),
    DataState loadingState = DataState.loading,
  }) async {
    return when(
      state.dataState,
      act: () => absenceRepository.getAbsences(
        page: page,
        type: state.selectedType,
        date: state.selectedDate,
      ),
      emit: (data) => emit(state.copyWith(dataState: data)),
      // if `loading` state require some additional data to be updated
      // then it can be overriden here. Otherwise, `when` can implicitily handle it.
      // In this case, we are updating page with new one that may have been requested.
      // As in case of failure, we don't want to lose the page number.
      loading: () => state.dataState.copyWith(
        state: loadingState,
        value: state.dataState.value?.copyWith(page: page),
      ),
      // if `failure` state require some additional data to be updated
      // then it can be overriden here. Otherwise, `when` can implicitily handle it.
      // In this case, we are converting loading state to failure state.
      // As in case of pagination, we want to fail the state related to the page
      // only and not the whole data state.
      failure: (error) => state.dataState.copyWith(
        error: error,
        state: loadingState.toFailure(),
      ),
    );
  }

  void selectType(AbsenceType? type) {
    emit(
      state.copyWith(selectedType: type == state.selectedType ? null : type),
    );
  }

  void selectDate(DateTimeRange? date) {
    emit(state.copyWith(selectedDate: date));
  }

  void reset() {
    emit(AbsenceState(dataState: state.dataState));
  }
}
