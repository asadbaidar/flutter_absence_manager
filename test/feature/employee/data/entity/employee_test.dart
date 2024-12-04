import 'package:core/feature/employee/employee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmployeeEntity', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'id': 1,
        'crewId': 2,
        'userId': 3,
        'name': 'John Doe',
        'image': 'image_url',
      };

      final entity = EmployeeEntity.fromJson(json);

      expect(entity.id, 1);
      expect(entity.crewId, 2);
      expect(entity.userId, 3);
      expect(entity.name, 'John Doe');
      expect(entity.image, 'image_url');
    });

    test('toJson converts an instance to JSON', () {
      final entity = EmployeeEntity(
        id: 1,
        crewId: 2,
        userId: 3,
        name: 'John Doe',
        image: 'image_url',
      );

      final json = entity.toJson();

      expect(json['id'], 1);
      expect(json['crewId'], 2);
      expect(json['userId'], 3);
      expect(json['name'], 'John Doe');
      expect(json['image'], 'image_url');
    });

    test('fromModel creates an instance from model', () {
      const model = Employee(
        id: 1,
        crewId: 2,
        userId: 3,
        name: 'John Doe',
        image: 'image_url',
      );

      final entity = EmployeeEntity.fromModel(model);

      expect(entity.id, 1);
      expect(entity.crewId, 2);
      expect(entity.userId, 3);
      expect(entity.name, 'John Doe');
      expect(entity.image, 'image_url');
    });

    test('toModel converts an instance to model', () {
      final entity = EmployeeEntity(
        id: 1,
        crewId: 2,
        userId: 3,
        name: 'John Doe',
        image: 'image_url',
      );

      final model = entity.toModel();

      expect(model.id, 1);
      expect(model.crewId, 2);
      expect(model.userId, 3);
      expect(model.name, 'John Doe');
      expect(model.image, 'image_url');
    });
  });
}
