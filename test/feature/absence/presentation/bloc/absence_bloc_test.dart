import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late AbsenceRepository absenceRepository;
  late AbsenceBloc absenceBloc;

  setUp(() {
    absenceRepository = MockAbsenceRepository();
    absenceBloc = AbsenceBloc(absenceRepository: absenceRepository);
  });

  group('AbsenceBloc', () {
    test('initial state is AbsenceState()', () {
      expect(absenceBloc.state, const AbsenceState());
    });

    group('getAbsences', () {
      final mockData = PagingList<Absence>(
        items: [
          const Absence(
            id: 1,
            type: AbsenceType.sickness,
          ),
        ],
        page: const PageInfo(totalItems: 1),
      );
      
      blocTest<AbsenceBloc, AbsenceState>(
        'emits loading and then new state with absences when getAbsences is successful',
        setUp: () => when(
          () => absenceRepository.getAbsences(
            page: any(named: 'page'),
            type: any(named: 'type'),
            date: any(named: 'date'),
          ),
        ).thenAnswer((_) async => mockData),
        build: () => absenceBloc,
        act: (bloc) => bloc.getAbsences(),
        expect: () => [
          const AbsenceState(dataState: Data.loading()),
          AbsenceState(
            dataState: Data.loaded(value: mockData),
          ),
        ],
      );

      blocTest<AbsenceBloc, AbsenceState>(
        'emits loading and then failure when getAbsences throws an error',
        setUp: () => when(
          () => absenceRepository.getAbsences(
            page: any(named: 'page'),
            type: any(named: 'type'),
            date: any(named: 'date'),
          ),
        ).thenThrow('Failed to load absences'),
        build: () => absenceBloc,
        act: (bloc) => bloc.getAbsences(),
        expect: () => [
          const AbsenceState(dataState: Data.loading()),
          const AbsenceState(
            dataState: Data.failure(error: 'Failed to load absences'),
          ),
        ],
      );
    });

    group('selectType', () {
      test('emits new state with selected type when called with different type',
          () {
        absenceBloc.selectType(AbsenceType.sickness);

        expect(absenceBloc.state.selectedType, AbsenceType.sickness);
      });

      test('emits new state with null type when called with same type', () {
        absenceBloc.selectType(AbsenceType.sickness);
        absenceBloc.selectType(AbsenceType.sickness);

        expect(absenceBloc.state.selectedType, isNull);
      });
    });

    group('selectDate', () {
      test('emits new state with selected date when called', () {
        final date = DateTimeRange(
          start: DateTime.now(),
          end: DateTime.now().add(const Duration(days: 1)),
        );

        absenceBloc.selectDate(date);

        expect(absenceBloc.state.selectedDate, date);
      });
    });

    group('reset', () {
      test('emits new state with same data state when called', () {
        absenceBloc.selectType(AbsenceType.sickness);
        absenceBloc.selectDate(
          DateTimeRange(
            start: DateTime.now(),
            end: DateTime.now().add(const Duration(days: 1)),
          ),
        );

        absenceBloc.reset();

        expect(absenceBloc.state.selectedType, isNull);
        expect(absenceBloc.state.selectedDate, isNull);
      });
    });
  });
}
