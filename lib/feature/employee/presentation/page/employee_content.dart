import 'package:common/common.dart';
import 'package:core/feature/absence/presentation/view/view.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:core/feature/employee/presentation/view/employee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class EmployeeContent extends StatelessWidget {
  const EmployeeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitle(
      title: LocaleStrings.employees,
      child: const Scaffold(
        appBar: CustomAppBar(
          customTitle: TitleView(),
          actions: [LocaleButton()],
        ),
        body: EmployeeListView(),
      ),
    );
  }
}
