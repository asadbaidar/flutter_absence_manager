import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence_state.freezed.dart';

typedef AbsenceDataState = Data<PagingList<Absence>>;

@freezed
class AbsenceState with _$AbsenceState {
  const factory AbsenceState({
    @Default(AbsenceDataState()) AbsenceDataState dataState,
    AbsenceType? selectedType,
    DateTimeRange? selectedDate,
  }) = _AbsenceState;
}

extension AbsenceStateValues on AbsenceState {
  List<Absence> get absences => dataState.value ?? [];

  Absence? getAbsenceById(int? id) {
    if (id == null) return null;
    return absences.firstWhereOrNull((e) => e.id == id);
  }

  int get totalAbsences => dataState.page.totalItems;

  bool get isFiltering => selectedType != null || selectedDate != null;

  bool get isNotFiltering => !isFiltering;
}
