import 'package:common/common.dart';
import 'package:core/common/paging_entity.dart';
import 'package:core/feature/employee/data/data.dart';
import 'package:core/feature/employee/domain/domain.dart';

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  EmployeeRemoteDataSourceImpl({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<PagingEntity<EmployeeEntity, Employee>> getEmployees() {
    return httpClient
        .post<JsonObject>(
          path: EmployeeEndpoints.members,
        )
        .then(
          (json) => PagingEntity<EmployeeEntity, Employee>.fromJson(
            json,
            (e) => EmployeeEntity.fromJson(e! as JsonObject),
          ),
        );
  }
}
