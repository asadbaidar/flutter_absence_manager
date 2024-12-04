import 'package:common/common.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

/// A widget that shows a list of employees.
class EmployeeListView extends StatelessWidget {
  const EmployeeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        return SmartListView.builder(
          physics: const ClampingScrollPhysics(),
          items: state.value,
          itemBuilder: (_, __, data) => EmployeeTile(data: data!),
          topSliverBuilder: (_) => const [_EmployeeHeader()],
          footerBuilder: (_) => 48.spaceY,
          // Shows error or empty message based on the current state
          replace: state.isFailureOrEmpty,
          replacementBuilder: (_) => DataError(
            data: state,
            emptyMessage: LocaleStrings.noEmployeeFound,
            onRetry: context.read<EmployeeBloc>().getEmployees,
          ),
        );
      },
    );
  }
}

class _EmployeeHeader extends StatelessWidget {
  const _EmployeeHeader();

  @override
  Widget build(BuildContext context) {
    return SmartSliverHeader(
      floating: context.isBelowSmallScreen,
      minExtent: kMinInteractiveDimension + 24,
      builder: (_, __, ___) => ColoredBox(
        color: context.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            LocaleStrings.employees,
            style: context.titleMedium,
          ),
        ),
      ),
    );
  }
}
