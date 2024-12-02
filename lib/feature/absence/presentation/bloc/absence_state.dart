import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';

typedef AbsenceState = Data<PagingList<Absence>>;

extension AbsenceStateValues on AbsenceState {
  List<Absence> get absences => value ?? [];
}
