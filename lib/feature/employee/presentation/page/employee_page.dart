import 'package:common/common.dart';
import 'package:core/feature/employee/presentation/page/employee_content.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  static String route() => RouteUri.tab(subroute());

  static String subroute() => TabItem.employee.name;

  @override
  Widget build(BuildContext context) {
    return const EmployeeContent();
  }
}
