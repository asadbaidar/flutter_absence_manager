import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence_state.freezed.dart';

typedef AbsenceDataState = Data<PagingList<Absence>>;

@freezed
class AbsenceState with _$AbsenceState {
  const factory AbsenceState({
    @Default(AbsenceDataState()) AbsenceDataState dataState,
  }) = _AbsenceState;
}
