import 'package:core/feature/absence/absence.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AbsenceEntity', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'id': 1,
        'crewId': 2,
        'userId': 3,
        'admitterId': 4,
        'createdAt': '2023-10-01T00:00:00.000Z',
        'rejectedAt': '2023-10-02T00:00:00.000Z',
        'confirmedAt': '2023-10-03T00:00:00.000Z',
        'startDate': '2023-10-04T00:00:00.000Z',
        'endDate': '2023-10-05T00:00:00.000Z',
        'type': 'sickness',
        'memberNote': 'note',
        'admitterNote': 'admitter note',
      };

      final entity = AbsenceEntity.fromJson(json);

      expect(entity.id, 1);
      expect(entity.crewId, 2);
      expect(entity.userId, 3);
      expect(entity.admitterId, 4);
      expect(entity.createdAt, '2023-10-01T00:00:00.000Z');
      expect(entity.rejectedAt, '2023-10-02T00:00:00.000Z');
      expect(entity.confirmedAt, '2023-10-03T00:00:00.000Z');
      expect(entity.startDate, '2023-10-04T00:00:00.000Z');
      expect(entity.endDate, '2023-10-05T00:00:00.000Z');
      expect(entity.type, 'sickness');
      expect(entity.memberNote, 'note');
      expect(entity.admitterNote, 'admitter note');
    });

    test('toJson converts an instance to JSON', () {
      final entity = AbsenceEntity(
        id: 1,
        crewId: 2,
        userId: 3,
        admitterId: 4,
        createdAt: '2023-10-01T00:00:00.000Z',
        rejectedAt: '2023-10-02T00:00:00.000Z',
        confirmedAt: '2023-10-03T00:00:00.000Z',
        startDate: '2023-10-04T00:00:00.000Z',
        endDate: '2023-10-05T00:00:00.000Z',
        type: 'sickness',
        memberNote: 'note',
        admitterNote: 'admitter note',
      );

      final json = entity.toJson();

      expect(json['id'], 1);
      expect(json['crewId'], 2);
      expect(json['userId'], 3);
      expect(json['admitterId'], 4);
      expect(json['createdAt'], '2023-10-01T00:00:00.000Z');
      expect(json['rejectedAt'], '2023-10-02T00:00:00.000Z');
      expect(json['confirmedAt'], '2023-10-03T00:00:00.000Z');
      expect(json['startDate'], '2023-10-04T00:00:00.000Z');
      expect(json['endDate'], '2023-10-05T00:00:00.000Z');
      expect(json['type'], 'sickness');
      expect(json['memberNote'], 'note');
      expect(json['admitterNote'], 'admitter note');
    });

    test('fromModel creates an instance from model', () {
      final model = Absence(
        id: 1,
        crewId: 2,
        userId: 3,
        admitterId: 4,
        createdAt: DateTime.parse('2023-10-01T00:00:00.000Z'),
        rejectedAt: DateTime.parse('2023-10-02T00:00:00.000Z'),
        confirmedAt: DateTime.parse('2023-10-03T00:00:00.000Z'),
        startDate: DateTime.parse('2023-10-04T00:00:00.000Z'),
        endDate: DateTime.parse('2023-10-05T00:00:00.000Z'),
        type: AbsenceType.sickness,
        memberNote: 'note',
        admitterNote: 'admitter note',
      );

      final entity = AbsenceEntity.fromModel(model);

      expect(entity.id, 1);
      expect(entity.crewId, 2);
      expect(entity.userId, 3);
      expect(entity.admitterId, 4);
      expect(entity.createdAt, '2023-10-01T00:00:00.000Z');
      expect(entity.rejectedAt, '2023-10-02T00:00:00.000Z');
      expect(entity.confirmedAt, '2023-10-03T00:00:00.000Z');
      expect(entity.startDate, '2023-10-04T00:00:00.000Z');
      expect(entity.endDate, '2023-10-05T00:00:00.000Z');
      expect(entity.type, 'sickness');
      expect(entity.memberNote, 'note');
      expect(entity.admitterNote, 'admitter note');
    });

    test('toModel converts an instance to model', () {
      final entity = AbsenceEntity(
        id: 1,
        crewId: 2,
        userId: 3,
        admitterId: 4,
        createdAt: '2023-10-01T00:00:00.000Z',
        rejectedAt: '2023-10-02T00:00:00.000Z',
        confirmedAt: '2023-10-03T00:00:00.000Z',
        startDate: '2023-10-04T00:00:00.000Z',
        endDate: '2023-10-05T00:00:00.000Z',
        type: 'sickness',
        memberNote: 'note',
        admitterNote: 'admitter note',
      );

      final model = entity.toModel();

      expect(model.id, 1);
      expect(model.crewId, 2);
      expect(model.userId, 3);
      expect(model.admitterId, 4);
      expect(
        model.createdAt,
        DateTime.parse('2023-10-01T00:00:00.000Z').toLocal(),
      );
      expect(
        model.rejectedAt,
        DateTime.parse('2023-10-02T00:00:00.000Z').toLocal(),
      );
      expect(
        model.confirmedAt,
        DateTime.parse('2023-10-03T00:00:00.000Z').toLocal(),
      );
      expect(model.startDate, DateTime.parse('2023-10-04T00:00:00.000Z'));
      expect(model.endDate, DateTime.parse('2023-10-05T00:00:00.000Z'));
      expect(model.type, AbsenceType.sickness);
      expect(model.memberNote, 'note');
      expect(model.admitterNote, 'admitter note');
    });
  });
}
