import 'package:common/common.dart';
import 'package:core/common/paging_entity.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late EmployeeRemoteDataSource dataSource;
  late EmployeeRepositoryImpl repository;

  setUp(() {
    dataSource = MockEmployeeRemoteDataSource();
    repository = EmployeeRepositoryImpl(dataSource: dataSource);
  });

  group('EmployeeRepository', () {
    test('getEmployees returns PagingList<Employee>', () async {
      final jsonResponse = {
        'result': [
          {
            'id': 1,
            'crewId': 2,
            'userId': 3,
            'name': 'John Doe',
            'image': 'image_url',
          }
        ],
        'pageInfo': {
          'current': 0,
          'size': 10,
          'totalItems': 1,
        },
      };

      when(
        () => dataSource.getEmployees(),
      ).thenAnswer(
        (_) async => PagingEntity<EmployeeEntity, Employee>.fromJson(
          jsonResponse,
          (e) => EmployeeEntity.fromJson(e! as JsonObject),
        ),
      );

      final result = await repository.getEmployees();

      expect(result.items.length, 1);
      expect(result.items.first.id, 1);
      expect(result.items.first.crewId, 2);
      expect(result.items.first.userId, 3);
      expect(result.items.first.name, 'John Doe');
      expect(result.items.first.image, 'image_url');
    });

    test('getEmployees throws an exception when dataSource fails', () async {
      when(
        () => dataSource.getEmployees(),
      ).thenThrow(Exception('Failed to load employees'));

      expect(
        () async => await repository.getEmployees(),
        throwsException,
      );
    });
  });
}
