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
        return Stack(
          children: [
            SmartLinearProgress.standard(visible: state.isLoading),
            _EmployeeList(data: state),
          ],
        );
      },
    );
  }
}

class _EmployeeList extends StatelessWidget {
  const _EmployeeList({
    required this.data,
  });

  final EmployeeState data;

  @override
  Widget build(BuildContext context) {
    return SmartListView.builder(
      physics: const ClampingScrollPhysics(),
      items: data.value,
      itemBuilder: (_, __, data) => _EmployeeTile(data: data!),
      bottomSliverBuilder: (_) => [48.spaceY.sliverBox],
      replace: data.isFailureOrEmpty,
      replacementBuilder: (_) => DataError(
        data: data,
        emptyMessage: 'No employee found',
        onRetry: context.read<EmployeeBloc>().getEmployees,
      ),
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
        subtitle: Text(data.id?.toString() ?? ''),
        leading: CircleAvatar(
          backgroundColor: context.surfaceContainer,
          backgroundImage:
              data.image?.notBlank == null ? null : NetworkImage(data.image!),
        ),
      ),
    );
  }
}
