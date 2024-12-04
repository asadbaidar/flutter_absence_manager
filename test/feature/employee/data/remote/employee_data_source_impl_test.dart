import 'package:common/common.dart';
import 'package:core/feature/employee/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late HttpClient httpClient;
  late EmployeeRemoteDataSourceImpl dataSource;

  setUp(() {
    httpClient = MockHttpClient();
    dataSource = EmployeeRemoteDataSourceImpl(httpClient: httpClient);
  });

  group('EmployeeRemoteDataSource', () {
    test('getEmployees returns PagingEntity<EmployeeEntity, Employee>',
        () async {
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
        () => httpClient.post<JsonObject>(
          path: EmployeeEndpoints.members,
        ),
      ).thenAnswer((_) async => jsonResponse);

      final data = await dataSource.getEmployees();

      expect(data.result?.length, 1);
      expect(data.result?.first.id, 1);
      expect(data.result?.first.crewId, 2);
      expect(data.result?.first.userId, 3);
      expect(data.result?.first.name, 'John Doe');
      expect(data.result?.first.image, 'image_url');
    });

    test('getEmployees throws an exception when httpClient fails', () async {
      when(
        () => httpClient.post<JsonObject>(
          path: EmployeeEndpoints.members,
        ),
      ).thenThrow(Exception('Failed to load employees'));

      expect(
        () async => await dataSource.getEmployees(),
        throwsException,
      );
    });
  });
}
