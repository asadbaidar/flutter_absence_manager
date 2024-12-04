import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class AbsenceDetailContent extends StatelessWidget {
  const AbsenceDetailContent({
    super.key,
    this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleStrings.absenceDetails,
          leading: const CloseButton(),
        ),
        body: _AbsenceDetailBody(id: id),
      ),
    );
  }
}

class _AbsenceDetailBody extends StatelessWidget {
  const _AbsenceDetailBody({
    required this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    final absence = context.select(
      (AbsenceBloc bloc) => bloc.state.getAbsenceById(id?.toIntOrNull()),
    );
    if (absence == null) {
      return CustomError(
        emptyMessage: LocaleStrings.noAbsenceFound,
      );
    }
    return Column(
      children: [
        Expanded(
          child: AbsenceDetailView(data: absence),
        ),
        // Show action buttons only if the absence status is not already
        // confirmed or rejected
        if (absence.status == AbsenceStatus.requested)
          const AbsenceActionButtons(),
      ],
    );
  }
}
