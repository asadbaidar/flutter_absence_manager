import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

/// A widget that shows the details of an absence.
class AbsenceDetailView extends StatelessWidget {
  const AbsenceDetailView({
    super.key,
    required this.data,
  });

  final Absence data;

  @override
  Widget build(BuildContext context) {
    final employee = context.select(
      (EmployeeBloc bloc) => bloc.state.getEmployeeById(data.userId),
    );
    return ListView(
      children: [
        AbsenceTile(
          absence: data,
          employee: employee,
          large: true,
        ),
        CustomTextField(
          label: LocaleStrings.fromDate,
          value: data.startDate?.formatEEEEMMMMdy,
        ),
        CustomTextField(
          label: LocaleStrings.toDate,
          value: data.endDate?.formatEEEEMMMMdy,
        ),
        CustomTextField(
          label: LocaleStrings.requestedAt,
          value: data.createdAt?.formatEEEEMMMMdy,
        ),
        CustomTextField(
          label: LocaleStrings.rejectedAt,
          value: data.rejectedAt?.formatEEEEMMMMdy,
        ),
        CustomTextField(
          label: LocaleStrings.confirmedAt,
          value: data.confirmedAt?.formatEEEEMMMMdy,
        ),
        CustomTextField(
          label: LocaleStrings.requesteeNote,
          value: data.memberNote,
        ),
        CustomTextField(
          label: LocaleStrings.admitterNote,
          value: data.admitterNote,
          readOnly: data.status != AbsenceStatus.requested,
        ),
      ],
    );
  }
}
