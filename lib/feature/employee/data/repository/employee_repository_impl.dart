import 'package:common/common.dart';
import 'package:core/feature/employee/data/data.dart';
import 'package:core/feature/employee/domain/domain.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  EmployeeRepositoryImpl({required this.dataSource});

  final EmployeeRemoteDataSource dataSource;

  @override
  Future<PagingList<Employee>> getEmployees() {
    return dataSource.getEmployees().then($mapToModel);
  }
}
