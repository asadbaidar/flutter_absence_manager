import 'package:common/common.dart';
import 'package:core/feature/absence/data/data.dart';
import 'package:core/feature/absence/domain/domain.dart';

class AbsenceRepositoryImpl implements AbsenceRepository {
  AbsenceRepositoryImpl({required this.dataSource});

  final AbsenceRemoteDataSource dataSource;

  @override
  Future<PagingList<Absence>> getAbsences({PageInfo? page}) {
    return dataSource.getAbsences(
      page: page?.current,
      pageSize: page?.size,
    ).then($mapToModel);
  }
}
