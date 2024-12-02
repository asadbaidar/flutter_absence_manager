import 'package:common/common.dart';
import 'package:core/feature/employee/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class EmployeeEntity implements ToModel<Employee> {
  EmployeeEntity({
    this.id,
    this.crewId,
    this.userId,
    this.name,
    this.image,
  });

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeeEntityFromJson(json);

  factory EmployeeEntity.fromModel(Employee model) => EmployeeEntity(
        id: model.id,
        crewId: model.crewId,
        userId: model.userId,
        name: model.name,
        image: model.image,
      );

  final int? id;
  final int? crewId;
  final int? userId;
  final String? name;
  final String? image;

  Map<String, dynamic> toJson() => _$EmployeeEntityToJson(this);

  @override
  Employee toModel() => Employee(
        id: id,
        crewId: crewId,
        userId: userId,
        name: name,
        image: image,
      );
}
