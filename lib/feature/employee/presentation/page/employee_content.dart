import 'package:common/common.dart';
import 'package:core/feature/absence/presentation/view/view.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: _EmployeeBody(),
      ),
    );
  }
}

class _EmployeeBody extends StatelessWidget {
  const _EmployeeBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        return CustomListView(
          itemCount: state.employees.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.employees[index].name ?? ''),
              leading: CircleAvatar(
                child: CustomNetworkImage(state.employees[index].image),
              ),
            );
          },
        );
      },
    );
  }
}
