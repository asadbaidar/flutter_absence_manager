import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsenceListView extends StatelessWidget {
  const AbsenceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      builder: (context, state) {
        return state.when(
          orElse: (_) => const CustomProgress.medium().paddingAll(16),
          failure: (data) => CustomError(
            isFailure: data.isFailure,
            message: data.errorMessage,
            onRetry: () => context.read<AbsenceBloc>().getAbsences(),
          ),
          loaded: (data) => _AbsenceList(items: state.absences),
        );
      },
    );
  }
}

class _AbsenceList extends StatelessWidget {
  const _AbsenceList({
    required this.items,
  });

  final List<Absence> items;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      itemCount: items.length,
      itemBuilder: (context, index) => _AbsenceTile(data: items[index]),
    );
  }
}

class _AbsenceTile extends StatelessWidget {
  const _AbsenceTile({
    required this.data,
  });

  final Absence data;

  @override
  Widget build(BuildContext context) {
    final employee = context.select(
      (EmployeeBloc bloc) => bloc.state.getEmployeeById(data.userId),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(employee?.name ?? ''),
        subtitle: Text(data.type ?? ''),
        leading: CircleAvatar(
          backgroundColor: context.surfaceContainer,
          backgroundImage: employee?.image?.notBlank == null
              ? null
              : NetworkImage(employee!.image!),
        ),
      ),
    );
  }
}
