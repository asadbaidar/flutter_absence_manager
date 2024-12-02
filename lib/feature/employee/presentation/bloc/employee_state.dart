import 'package:common/common.dart';
import 'package:core/feature/employee/domain/domain.dart';

typedef EmployeeState = Data<PagingList<Employee>>;

extension EmployeeStateValues on EmployeeState {
  List<Employee> get employees => value ?? [];

  Employee? getEmployeeById(int? id) {
    if (id == null) return null;
    return employees.firstWhere((element) => element.userId == id);
  }
}
