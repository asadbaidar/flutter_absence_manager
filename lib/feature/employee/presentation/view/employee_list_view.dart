import 'package:common/common.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListView extends StatelessWidget {
  const EmployeeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        return state.when(
          orElse: (_) => const CustomProgress.medium().paddingAll(16),
          failure: (data) => CustomError(
            isFailure: data.isFailure,
            message: data.errorMessage,
            onRetry: () => context.read<EmployeeBloc>().getEmployees(),
          ).sliverBox,
          loaded: (data) => _EmployeeList(items: state.employees),
        );
      },
    );
  }
}

class _EmployeeList extends StatelessWidget {
  const _EmployeeList({
    required this.items,
  });

  final List<Employee> items;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      itemCount: items.length,
      itemBuilder: (context, index) => _EmployeeTile(data: items[index]),
    );
  }
}

class _EmployeeTile extends StatelessWidget {
  const _EmployeeTile({
    required this.data,
  });

  final Employee data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(data.name ?? ''),
        leading: CircleAvatar(
          backgroundColor: context.surfaceContainer,
          backgroundImage:
              data.image?.notBlank == null ? null : NetworkImage(data.image!),
        ),
      ),
    );
  }
}
