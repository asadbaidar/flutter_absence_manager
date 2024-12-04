import 'package:common/common.dart';
import 'package:core/feature/absence/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'absence.g.dart';

@JsonSerializable()
class AbsenceEntity implements ToModel<Absence> {
  AbsenceEntity({
    this.id,
    this.crewId,
    this.userId,
    this.admitterId,
    this.createdAt,
    this.rejectedAt,
    this.confirmedAt,
    this.startDate,
    this.endDate,
    this.type,
    this.memberNote,
    this.admitterNote,
  });

  factory AbsenceEntity.fromJson(Map<String, dynamic> json) =>
      _$AbsenceEntityFromJson(json);

  factory AbsenceEntity.fromModel(Absence model) => AbsenceEntity(
        id: model.id,
        crewId: model.crewId,
        userId: model.userId,
        admitterId: model.admitterId,
        createdAt: model.createdAt?.toIso8601String(),
        rejectedAt: model.rejectedAt?.toIso8601String(),
        confirmedAt: model.confirmedAt?.toIso8601String(),
        startDate: model.startDate?.toIso8601String(),
        endDate: model.endDate?.toIso8601String(),
        type: model.type?.name,
        memberNote: model.memberNote,
        admitterNote: model.admitterNote,
      );

  final int? id;
  final int? crewId;
  final int? userId;
  final int? admitterId;
  final String? createdAt;
  final String? rejectedAt;
  final String? confirmedAt;
  final String? startDate;
  final String? endDate;
  final String? type;
  final String? memberNote;
  final String? admitterNote;

  Map<String, dynamic> toJson() => _$AbsenceEntityToJson(this);

  @override
  Absence toModel() => Absence(
        id: id,
        crewId: crewId,
        userId: userId,
        admitterId: admitterId,
        createdAt: createdAt?.mapTo(DateTime.tryParse),
        rejectedAt: rejectedAt?.mapTo(DateTime.tryParse),
        confirmedAt: confirmedAt?.mapTo(DateTime.tryParse),
        startDate: startDate?.mapTo(DateTime.tryParse),
        endDate: endDate?.mapTo(DateTime.tryParse),
        type: type?.mapTo(AbsenceType.fromString),
        memberNote: memberNote,
        admitterNote: admitterNote,
      );
}
