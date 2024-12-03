import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';
import 'package:core/feature/absence/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsenceBloc extends Cubit<AbsenceState> with SafeBloc {
  AbsenceBloc({
    required this.absenceRepository,
  }) : super(const AbsenceState());

  final AbsenceRepository absenceRepository;

  Future<void> getAbsences({
    PageInfo page = const PageInfo(),
    DataState loadingState = DataState.loading,
  }) async {
    return when(
      state.dataState,
      act: () => absenceRepository.getAbsences(page: page),
      emit: (data) => emit(state.copyWith(dataState: data)),
      loading: () => state.dataState.copyWith(
        state: loadingState,
        value: state.dataState.value?.copyWith(page: page),
      ),
      failure: (error) => state.dataState.copyWith(
        error: error,
        state: loadingState.toFailure(),
      ),
    );
  }
}
