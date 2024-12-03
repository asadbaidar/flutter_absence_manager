import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return LifecycleObserver(
      key: ValueKey(context.newTab),
      onInit: () {
        final tab = context.newTab;
        if (tab != null) context.read<TabBloc>().changeTab(tab);
      },
      child: const _TabScafold(),
    );
  }
}

class _TabScafold extends StatelessWidget {
  const _TabScafold();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.bottomNavigationBarTheme,
      child: BlocBuilder<TabBloc, TabState>(
        builder: (context, state) {
          return Scaffold(
            body: _SideNavBody(state.currentTab),
            bottomNavigationBar: context.isMiniOrSmallScreen
                ? BottomNavBar(
                    currentTab: state.currentTab,
                    onSelect: context.changeTab,
                  )
                : null,
            floatingActionButton: context.isMiniOrSmallScreen
                ? const RequestAbsenceButton()
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}

class _SideNavBody extends StatelessWidget {
  const _SideNavBody(this.currentTab);

  final TabItem currentTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (context.isMediumOrLargeScreen)
          SideNavBar(
            currentTab: currentTab,
            onSelect: context.changeTab,
            leading: const RequestAbsenceButton(),
          ),
        Expanded(
          child: _TabBody(currentTab),
        ),
      ],
    );
  }
}

class _TabBody extends StatelessWidget {
  const _TabBody(this.currentTab);

  final TabItem currentTab;

  @override
  Widget build(BuildContext context) {
    switch (currentTab) {
      case TabItem.absence:
        return const AbsencePage();
      case TabItem.employee:
        return const EmployeePage();
      default:
        return const SizedBox.shrink();
    }
  }
}

class RequestAbsenceButton extends StatelessWidget {
  const RequestAbsenceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}

extension on BuildContext {
  void changeTab(TabItem tab) => read<TabBloc>().changeTab(tab, router: router);
}
