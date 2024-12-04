import 'package:core/feature/absence/absence.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Absence', () {
    test('copyWith creates a new Absence with updated values', () {
      final model = AbsenceEntity(
        id: 1,
        crewId: 2,
        userId: 3,
        admitterId: 4,
        startDate: '2023-10-04T00:00:00.000Z',
        endDate: '2023-10-05T00:00:00.000Z',
        type: 'sickness',
        memberNote: 'note',
        admitterNote: 'admitter note',
      ).toModel();

      final updatedModel = model.copyWith(
        memberNote: 'updated note',
      );

      expect(updatedModel.id, 1);
      expect(
        updatedModel.startDate?.toIso8601String(),
        '2023-10-04T00:00:00.000Z',
      );
      expect(
        updatedModel.endDate?.toIso8601String(),
        '2023-10-05T00:00:00.000Z',
      );
      expect(updatedModel.type, AbsenceType.sickness);
      expect(updatedModel.memberNote, 'updated note');
      expect(updatedModel.admitterNote, 'admitter note');
    });

    test('equality comparison checks equality of two Absences', () {
      final model1 = AbsenceEntity(
        id: 1,
        crewId: 2,
        userId: 3,
        admitterId: 4,
        startDate: '2023-10-04T00:00:00.000Z',
        endDate: '2023-10-05T00:00:00.000Z',
        type: 'sickness',
        memberNote: 'note',
        admitterNote: 'admitter note',
      ).toModel();

      final model2 = AbsenceEntity(
        id: 1,
        crewId: 2,
        userId: 3,
        admitterId: 4,
        startDate: '2023-10-04T00:00:00.000Z',
        endDate: '2023-10-05T00:00:00.000Z',
        type: 'sickness',
        memberNote: 'note',
        admitterNote: 'admitter note',
      ).toModel();

      final model3 = AbsenceEntity(
        id: 2,
        crewId: 3,
        userId: 4,
        admitterId: 5,
        startDate: '2023-10-09T00:00:00.000Z',
        endDate: '2023-10-10T00:00:00.000Z',
        type: 'vacation',
        memberNote: 'another note',
        admitterNote: 'another admitter note',
      ).toModel();

      expect(model1, model2);
      expect(model1, isNot(model3));
    });
  });
}
