import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

/// A widget that shows the title and filters for absences.
class AbsenceFilterBar extends StatelessWidget {
  const AbsenceFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.surface,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            _AbsenceFilterCount(),
            SizedBox(width: 8),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _AbsenceFilterType(),
                    SizedBox(width: 8),
                    _AbsenceFilterDate(),
                    SizedBox(width: 8),
                    _AbsenceFilterReset(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A widget that shows the title and a total count of filtered absences.
class _AbsenceFilterCount extends StatelessWidget {
  const _AbsenceFilterCount();

  @override
  Widget build(BuildContext context) {
    final total = context.select(
      (AbsenceBloc bloc) => bloc.state.totalAbsences,
    );
    return Text(
      LocaleStrings.absenceCount(total),
      style: context.titleMedium,
    );
  }
}

/// A widget that shows a `all` option to clear the absence filters and
/// refetch all absences.
class _AbsenceFilterReset extends StatelessWidget {
  const _AbsenceFilterReset();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      buildWhen: (previous, current) =>
          previous.selectedType != current.selectedType ||
          previous.selectedDate != current.selectedDate,
      builder: (context, state) {
        return CustomInputChip(
          icon: const AssetIcon.monotone(AssetIcons.filter),
          text: LocaleStrings.all,
          selected: state.isNotFiltering,
          onSelected: (_) => context.read<AbsenceBloc>().reset(),
        );
      },
    );
  }
}

/// A widget that shows a date range picker to filter absences.
///
/// When a date is selected, it will refetch the absences from server with
/// paginated results.
class _AbsenceFilterDate extends StatelessWidget {
  const _AbsenceFilterDate();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      buildWhen: (previous, current) =>
          previous.selectedDate != current.selectedDate,
      builder: (context, state) {
        return CustomInputChip(
          icon: const AssetIcon.monotone(AssetIcons.schedule),
          text: LocaleStrings.date,
          selected: state.selectedDate != null,
          onSelected: (_) => showDatePicker(
            context,
            initialDate: state.selectedDate,
          ),
        );
      },
    );
  }

  void showDatePicker(
    BuildContext context, {
    DateTimeRange? initialDate,
  }) {
    showDateRangePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now().afterYear,
      currentDate: DateTime.now(),
      initialDateRange: initialDate,
      builder: (context, child) => Theme(
        data: context.dialogTheme,
        child: Dialog(child: child),
      ),
    ).then((date) {
      if (date != null && context.mounted) {
        context.read<AbsenceBloc>().selectDate(date);
      }
    });
  }
}

/// A widget that shows a list of absence types to filter.
///
/// When a type is selected, it will fetch the absences from server based
/// with paginated results.
class _AbsenceFilterType extends StatelessWidget {
  const _AbsenceFilterType();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      buildWhen: (previous, current) =>
          previous.selectedType != current.selectedType,
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: AbsenceType.values.map((type) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: CustomInputChip(
                text: type.toString(),
                selected: state.selectedType == type,
                onSelected: (_) => context.read<AbsenceBloc>().selectType(type),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
