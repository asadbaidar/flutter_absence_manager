import 'package:core/common/paging_entity.dart';
import 'package:core/feature/absence/data/data.dart';
import 'package:core/feature/absence/domain/domain.dart';

abstract class AbsenceRemoteDataSource {
  Future<PagingEntity<AbsenceEntity, Absence>> getAbsences();
}
