import 'package:freezed_annotation/freezed_annotation.dart';

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
    String? type,
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
}

enum AbsenceStatus {
  requested,
  confirmed,
  rejected,
}
