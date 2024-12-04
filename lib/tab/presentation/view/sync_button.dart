import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

/// A button to sync the employees and absences data.
class SyncButton extends StatelessWidget {
  const SyncButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      tooltip: LocaleStrings.syncronize,
      icon: const Icon(Icons.sync),
      onPressed: () {
        context.read<EmployeeBloc>().getEmployees();
        context.read<AbsenceBloc>().getAbsences();
      },
    );
  }
}
