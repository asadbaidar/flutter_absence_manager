import 'package:core/common/paging_entity.dart';
import 'package:core/feature/employee/data/data.dart';
import 'package:core/feature/employee/domain/domain.dart';

abstract class EmployeeRemoteDataSource {
  Future<PagingEntity<EmployeeEntity, Employee>> getEmployees();
}
