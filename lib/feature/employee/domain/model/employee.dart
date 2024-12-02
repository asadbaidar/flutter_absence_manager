import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    int? id,
    int? crewId,
    int? userId,
    String? name,
    String? image,
  }) = _Employee;
}
