import 'package:common/common.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class EmployeeContent extends StatelessWidget {
  const EmployeeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitle(
      title: LocaleStrings.employees,
      child: const _EmployeeBody(),
    );
  }
}

class _EmployeeBody extends StatelessWidget {
  const _EmployeeBody();

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((EmployeeBloc bloc) => bloc.state.isLoading);
    return Stack(
      children: [
        const EmployeeListView(),
        SmartLinearProgress.standard(visible: isLoading),
      ],
    );
  }
}
