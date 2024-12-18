import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';
import 'package:flutter/material.dart';

abstract class AbsenceRepository {
  Future<PagingList<Absence>> getAbsences({
    PageInfo? page,
    AbsenceType? type,
    DateTimeRange? date,
  });
}
