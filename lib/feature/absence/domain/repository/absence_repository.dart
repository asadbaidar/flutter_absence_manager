import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';

abstract class AbsenceRepository {
  Future<PagingList<Absence>> getAbsences();
}
