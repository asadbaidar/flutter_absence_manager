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
      buildWhen: (previous, current) => previous.dataState != current.dataState,
      builder: (context, state) {
        return Stack(
          children: [
            SmartLinearProgress.standard(visible: state.dataState.isLoading),
            Expanded(child: _AbsenceList(data: state.dataState)),
          ],
        );
      },
    );
  }
}

class _AbsenceList extends StatelessWidget {
  const _AbsenceList({required this.data});

  final AbsenceDataState data;

  @override
  Widget build(BuildContext context) {
    return SmartDataPagingListView.builder(
      data: data,
      itemBuilder: (_, __, data) => _AbsenceTile(data: data!),
      bottomSliverBuilder: (_) => [48.spaceY.sliverBox],
      pageWithScrolling: context.isPhone,
      onPageChange: (page) => context
          .read<AbsenceBloc>()
          .getAbsences(page: page, loadingState: DataState.pageLoading),
      pageLoadingBuilder: (_) => const SmartLinearProgress.standard(),
      pageButtonBuilder: (_, load) => PagingButton(onPressed: load),
      pageFailureBuilder: (_, reload) => PageError(data: data, onRetry: reload),
      replace: data.isFailure,
      replacementBuilder: (_) => DataError(
        data: data,
        emptyMessage: 'No absences found',
        onRetry: context.read<AbsenceBloc>().getAbsences,
      ),
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
