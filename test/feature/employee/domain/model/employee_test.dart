import 'package:core/feature/employee/employee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Employee', () {
    test('copyWith works correctly', () {
      const employee = Employee(
        id: 1,
        crewId: 2,
        userId: 3,
        name: 'John Doe',
        image: 'image_url',
      );

      final updatedEmployee = employee.copyWith(name: 'Jane Doe');

      expect(updatedEmployee.name, 'Jane Doe');
      expect(updatedEmployee.id, 1);
      expect(updatedEmployee.crewId, 2);
      expect(updatedEmployee.userId, 3);
      expect(updatedEmployee.image, 'image_url');
    });

    test('supports value equality', () {
      const model1 = Employee(
        id: 1,
        crewId: 2,
        userId: 3,
        name: 'John Doe',
        image: 'image_url',
      );

      const model2 = Employee(
        id: 1,
        crewId: 2,
        userId: 3,
        name: 'John Doe',
        image: 'image_url',
      );

      expect(model1, model2);
    });
  });
}
