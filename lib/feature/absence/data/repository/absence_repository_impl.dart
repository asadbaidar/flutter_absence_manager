import 'package:common/common.dart';
import 'package:core/feature/absence/data/data.dart';
import 'package:core/feature/absence/domain/domain.dart';
import 'package:flutter/material.dart';

class AbsenceRepositoryImpl implements AbsenceRepository {
  AbsenceRepositoryImpl({required this.dataSource});

  final AbsenceRemoteDataSource dataSource;

  @override
  Future<PagingList<Absence>> getAbsences({
    PageInfo? page,
    AbsenceType? type,
    DateTimeRange? date,
  }) {
    return dataSource
        .getAbsences(
          page: page?.current,
          pageSize: page?.size,
          type: type?.name,
          startDate: date?.start.formatYMMd,
          endDate: date?.end.formatYMMd,
        )
        .then($mapToModel);
  }
}
