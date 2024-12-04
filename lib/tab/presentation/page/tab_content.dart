import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The content of the tabs, pages and navigation bar.
///
/// Naivgation bar is placed at the bottom of the small screens
/// and on the side of the large screens.
class TabContent extends StatelessWidget {
  const TabContent({super.key});

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
            appBar: const TitleBar(),
            body: _SideNavBody(state.currentTab),
            bottomNavigationBar: context.isBelowSmallScreen
                ? BottomNavBar(
                    currentTab: state.currentTab,
                    onSelect: context.changeTab,
                  )
                : null,
            floatingActionButton: context.isBelowSmallScreen
                ? const AbsenceRequestButton()
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
        if (context.isAboveSmallScreen)
          SideNavBar(
            currentTab: currentTab,
            onSelect: context.changeTab,
            action: const AbsenceRequestButton(),
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

extension on BuildContext {
  /// A private method to change the tab
  void changeTab(TabItem tab) => read<TabBloc>().changeTab(tab, router: router);
}
