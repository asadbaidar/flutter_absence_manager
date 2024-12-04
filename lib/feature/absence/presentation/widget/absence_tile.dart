import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

/// A widget that displays the absence and the requestee data in a tile.
///
/// - In `small` screens, it displays the absence status, type, period in days,
///   and the requestee name.
/// - In `medium` screens, it extends the information to include the from/to dates.
/// - In `large` screens, it extends to requested at date as well.
class AbsenceTile extends StatelessWidget {
  const AbsenceTile({
    super.key,
    required this.absence,
    this.employee,
    this.large = false,
  });

  final Absence absence;
  final Employee? employee;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomListTile(
        customTitle: _AbsenceTileTitle(
          absence: absence,
          employee: employee,
          large: large,
        ),
        customSubtitle: _AbsenceTileSubtitle(
          absence: absence,
          large: large,
        ),
        titleStyle: large ? context.titleLarge : null,
        subtitleStyle: large ? context.bodyLarge?.focused() : null,
        leading: CustomAvatar(
          large: large,
          image: employee?.image,
        ).paddingOnly(end: 8),
        verticalSpacing: large ? 8 : 4,
      ),
    );
  }
}

class _AbsenceTileTitle extends StatelessWidget {
  const _AbsenceTileTitle({
    required this.absence,
    this.employee,
    this.large = false,
  });

  final Absence absence;
  final Employee? employee;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final extend = context.isAboveMediumScreen;
    final extendToLarge = context.isAboveLargeScreen;
    final bodySmall = context.bodySmall?.focused();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          employee?.name ?? '',
        ).expanded(enabled: extend),
        if (!large && extend) ...[
          if (extendToLarge)
            Text(LocaleStrings.requestedAt, style: bodySmall).expanded(),
          Text(LocaleStrings.fromDate, style: bodySmall).expanded(),
          Text(LocaleStrings.toDate, style: bodySmall).expanded(),
        ] else
          const Spacer(),
        Align(
          alignment: extend
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.centerEnd,
          child: CustomTextChip(
            text: absence.status.toString(),
            color: absence.status.color,
            textStyle: large ? context.bodyMedium?.focused() : null,
          ),
        ).expanded(enabled: extend && !large),
      ],
    );
  }
}

class _AbsenceTileSubtitle extends StatelessWidget {
  const _AbsenceTileSubtitle({
    required this.absence,
    this.large = false,
  });

  final Absence absence;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final extend = context.isAboveMediumScreen;
    final extendToLarge = context.isAboveLargeScreen;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(absence.type.toString()).expanded(enabled: extend),
        if (!large && extend) ...[
          if (extendToLarge)
            Text(absence.createdAt?.formatEMMMdy ?? '').expanded(),
          Text(absence.startDate?.formatEMMMdy ?? '').expanded(),
          Text(absence.endDate?.formatEMMMdy ?? '').expanded(),
        ] else
          const Spacer(),
        Text(absence.periodInDays).expanded(enabled: extend && !large),
      ],
    );
  }
}

extension AbsenceStatusColor on AbsenceStatus {
  Color get color {
    switch (this) {
      case AbsenceStatus.requested:
        return Colors.orange;
      case AbsenceStatus.confirmed:
        return Colors.green;
      case AbsenceStatus.rejected:
        return Colors.red;
    }
  }
}
