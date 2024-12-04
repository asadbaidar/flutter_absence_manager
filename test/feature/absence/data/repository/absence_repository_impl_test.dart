import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late AbsenceRemoteDataSource dataSource;
  late AbsenceRepositoryImpl repository;

  setUp(() {
    dataSource = MockAbsenceRemoteDataSource();
    repository = AbsenceRepositoryImpl(dataSource: dataSource);
  });

  group('AbsenceRepository', () {
    test('getAbsences returns PagingList<Absence>', () async {
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
          'total': 1,
        },
      };

      when(
        () => dataSource.getAbsences(
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
          type: any(named: 'type'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
        ),
      ).thenAnswer(
        (_) async => PagingEntity<AbsenceEntity, Absence>.fromJson(
          jsonResponse,
          (e) => AbsenceEntity.fromJson(e! as JsonObject),
        ),
      );

      final result = await repository.getAbsences(
        page: const PageInfo(),
        type: AbsenceType.sickness,
        date: DateTimeRange(
          start: DateTime.parse('2023-10-01'),
          end: DateTime.parse('2023-10-05'),
        ),
      );

      expect(result.items.length, 1);
      expect(result.items.first.id, 1);
      expect(result.items.first.crewId, 2);
      expect(result.items.first.userId, 3);
      expect(result.items.first.admitterId, 4);
      expect(
        result.items.first.createdAt,
        DateTime.parse('2023-10-01T00:00:00.000Z').toLocal(),
      );
      expect(
        result.items.first.rejectedAt,
        DateTime.parse('2023-10-02T00:00:00.000Z').toLocal(),
      );
      expect(
        result.items.first.confirmedAt,
        DateTime.parse('2023-10-03T00:00:00.000Z').toLocal(),
      );
      expect(
        result.items.first.startDate,
        DateTime.parse('2023-10-04T00:00:00.000Z'),
      );
      expect(
        result.items.first.endDate,
        DateTime.parse('2023-10-05T00:00:00.000Z'),
      );
      expect(result.items.first.type, AbsenceType.sickness);
      expect(result.items.first.memberNote, 'note');
      expect(result.items.first.admitterNote, 'admitter note');
    });

    test('getAbsences throws an exception when dataSource fails', () {
      when(
        () => dataSource.getAbsences(
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
          type: any(named: 'type'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
        ),
      ).thenThrow(Exception('error'));

      expect(
        () => repository.getAbsences(
          page: const PageInfo(),
          type: AbsenceType.sickness,
          date: DateTimeRange(
            start: DateTime.parse('2023-10-01'),
            end: DateTime.parse('2023-10-05'),
          ),
        ),
        throwsException,
      );
    });
  });
}
