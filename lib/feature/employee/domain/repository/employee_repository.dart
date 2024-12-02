import 'package:common/common.dart';
import 'package:core/feature/employee/domain/domain.dart';

abstract class EmployeeRepository {
  Future<PagingList<Employee>> getEmployees();
}
