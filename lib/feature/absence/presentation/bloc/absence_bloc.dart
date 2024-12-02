import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';
import 'package:core/feature/absence/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsenceBloc extends Cubit<AbsenceState> with SafeBloc {
  AbsenceBloc({
    required this.absenceRepository,
  }) : super(const AbsenceState());

  final AbsenceRepository absenceRepository;

  Future<void> getAbsences() {
    return when(
      state,
      act: () => absenceRepository.getAbsences(),
      emit: emit,
    );
  }
}
