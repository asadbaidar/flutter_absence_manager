import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:core/feature/employee/domain/domain.dart';
import 'package:core/feature/employee/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late EmployeeRepository employeeRepository;
  late EmployeeBloc employeeBloc;

  setUp(() {
    employeeRepository = MockEmployeeRepository();
    employeeBloc = EmployeeBloc(employeeRepository: employeeRepository);
  });

  group('EmployeeBloc', () {
    test('initial state is EmployeeState', () {
      expect(employeeBloc.state, const EmployeeState());
    });

    group('getEmployees', () {
      final mockData = PagingList<Employee>(
        items: [
          const Employee(
            id: 1,
            crewId: 2,
            userId: 3,
            name: 'John Doe',
            image: 'image_url',
          ),
        ],
      );

      blocTest<EmployeeBloc, EmployeeState>(
        'emits [EmployeeState.loading, EmployeeState.loaded] when getEmployees is successful',
        setUp: () => when(
          () => employeeRepository.getEmployees(),
        ).thenAnswer((_) async => mockData),
        build: () => employeeBloc,
        act: (bloc) => bloc.getEmployees(),
        expect: () => [
          const EmployeeState.loading(),
          EmployeeState.loaded(value: mockData),
        ],
      );

      blocTest<EmployeeBloc, EmployeeState>(
        'emits [EmployeeState.loading, EmployeeState.error] when getEmployees fails',
        setUp: () => when(
          () => employeeRepository.getEmployees(),
        ).thenThrow('Failed to load employees'),
        build: () => employeeBloc,
        act: (bloc) => bloc.getEmployees(),
        expect: () => [
          const EmployeeState.loading(),
          const EmployeeState.failure(error: 'Failed to load employees'),
        ],
      );
    });
  });
}
