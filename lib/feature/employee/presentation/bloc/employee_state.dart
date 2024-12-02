import 'package:common/common.dart';
import 'package:core/feature/employee/domain/domain.dart';

typedef EmployeeState = Data<PagingList<Employee>>;

extension EmployeeStateValues on EmployeeState {
  List<Employee> get employees => value ?? [];
}
