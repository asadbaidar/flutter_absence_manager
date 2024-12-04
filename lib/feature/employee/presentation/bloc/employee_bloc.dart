import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/domain/domain.dart';
import 'package:core/feature/employee/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Cubit<EmployeeState> with SafeBloc {
  EmployeeBloc({
    required this.employeeRepository,
  }) : super(const EmployeeState());

  final EmployeeRepository employeeRepository;

  /// Fetches employees from the repository and emits the new state.
  /// 
  /// To understand `when` method, check detailed documentation in
  /// [AbsenceBloc.getAbsences]
  Future<void> getEmployees() {
    return when(
      state,
      act: () => employeeRepository.getEmployees(),
      emit: emit,
    );
  }
}
