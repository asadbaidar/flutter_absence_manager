import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late HttpClient httpClient;
  late AbsenceRemoteDataSource dataSource;

  setUp(() {
    httpClient = MockHttpClient();
    dataSource = AbsenceRemoteDataSourceImpl(httpClient: httpClient);
  });

  group('AbsenceRemoteDataSource', () {
    test('getAbsences returns PagingEntity<AbsenceEntity, Absence>', () async {
      final jsonResponse = {
        'result': [
          {
            'id': 1,
            'crewId': 2,
            'userId': 3,
            'admitterId': 4,
            'createdAt': '2023-10-01T00:00:00.000Z',
            'rejectedAt': '2023-10-02T00:00:00.000Z',
            'confirmedAt': '2023-10-03T00:00:00.000Z',
            'startDate': '2023-10-04T00:00:00.000Z',
            'endDate': '2023-10-05T00:00:00.000Z',
            'type': 'sickness',
            'memberNote': 'note',
            'admitterNote': 'admitter note',
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
          path: AbsenceEndpoints.absences,
          body: any<JsonObject>(named: 'body'),
        ),
      ).thenAnswer((_) async => jsonResponse);

      final data = await dataSource.getAbsences(
        page: 1,
        pageSize: 10,
        type: 'sickness',
        startDate: '2023-10-01',
        endDate: '2023-10-05',
      );

      expect(data.result?.length, 1);
      expect(data.result?.first.id, 1);
      expect(data.result?.first.crewId, 2);
      expect(data.result?.first.userId, 3);
      expect(data.result?.first.admitterId, 4);
      expect(data.result?.first.createdAt, '2023-10-01T00:00:00.000Z');
      expect(data.result?.first.rejectedAt, '2023-10-02T00:00:00.000Z');
      expect(data.result?.first.confirmedAt, '2023-10-03T00:00:00.000Z');
      expect(data.result?.first.startDate, '2023-10-04T00:00:00.000Z');
      expect(data.result?.first.endDate, '2023-10-05T00:00:00.000Z');
      expect(data.result?.first.type, 'sickness');
      expect(data.result?.first.memberNote, 'note');
      expect(data.result?.first.admitterNote, 'admitter note');
    });

    test('getAbsences throws an exception when httpClient fails', () async {
      when(
        () => httpClient.post<JsonObject>(
          path: AbsenceEndpoints.absences,
          body: any<JsonObject>(named: 'body'),
        ),
      ).thenThrow(Exception('Failed to load absences'));

      expect(
        () async => await dataSource.getAbsences(
          page: 1,
          pageSize: 10,
          type: 'sickness',
          startDate: '2023-10-01',
          endDate: '2023-10-05',
        ),
        throwsException,
      );
    });
  });
}
