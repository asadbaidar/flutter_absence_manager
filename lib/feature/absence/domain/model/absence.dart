import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locale/locale.dart';

part 'absence.freezed.dart';

@freezed
class Absence with _$Absence {
  const factory Absence({
    int? id,
    int? crewId,
    int? userId,
    int? admitterId,
    DateTime? createdAt,
    DateTime? rejectedAt,
    DateTime? confirmedAt,
    DateTime? startDate,
    DateTime? endDate,
    AbsenceType? type,
    String? memberNote,
    String? admitterNote,
  }) = _Absence;
}

extension AbsenceGetters on Absence {
  AbsenceStatus get status {
    if (confirmedAt != null) {
      return AbsenceStatus.confirmed;
    } else if (rejectedAt != null) {
      return AbsenceStatus.rejected;
    }
    return AbsenceStatus.requested;
  }

  Duration get period => startDate!.isAtSameMomentAs(endDate!)
      ? 1.days
      : endDate!.difference(startDate!);

  String get periodInDays => LocaleStrings.days(period.inDays);
}

enum AbsenceStatus {
  requested,
  confirmed,
  rejected,
  ;

  String get title {
    switch (this) {
      case AbsenceStatus.requested:
        return LocaleStrings.requested;
      case AbsenceStatus.confirmed:
        return LocaleStrings.confirmed;
      case AbsenceStatus.rejected:
        return LocaleStrings.rejected;
    }
  }

  @override
  String toString() => title;
}

/// Absence types should also be loaded from the server.
enum AbsenceType {
  sickness,
  vacation,
  ;

  String get title {
    switch (this) {
      case AbsenceType.sickness:
        return LocaleStrings.sickness;
      case AbsenceType.vacation:
        return LocaleStrings.vacation;
    }
  }

  @override
  String toString() => title;

  static AbsenceType? fromString(String value) {
    return AbsenceType.values.byNameOrNull(value);
  }
}
