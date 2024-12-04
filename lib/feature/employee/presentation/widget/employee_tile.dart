import 'package:common/common.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';

/// A widget that displays the employee data in a tile.
class EmployeeTile extends StatelessWidget {
  const EmployeeTile({
    super.key,
    required this.data,
  });

  final Employee data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomListTile(
        title: data.name,
        subtitle: data.id?.toString(),
        leading: CustomAvatar(
          image: data.image,
        ).paddingOnly(end: 8),
      ),
    );
  }
}
