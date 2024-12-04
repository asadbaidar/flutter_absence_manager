import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';

/// A widget that displays a bottom navigation bar.
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentTab,
    required this.onSelect,
  });

  final TabItem currentTab;
  final OnValue<TabItem> onSelect;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentTab.$index,
      destinations: TabItem.items.map(BottomNavItem.new).toList(),
      onDestinationSelected: (index) => onSelect(TabItem.items[index]),
    );
  }
}

/// A widget that displays a side navigation bar.
class SideNavBar extends StatelessWidget {
  const SideNavBar({
    super.key,
    required this.currentTab,
    required this.onSelect,
    this.action,
  });

  final TabItem currentTab;
  final OnValue<TabItem> onSelect;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final extended = context.isAboveLargeScreen;
    return NavigationRail(
      selectedIndex: currentTab.$index,
      destinations: TabItem.items.map(SideNavItem.new).toList(),
      onDestinationSelected: (index) => onSelect(TabItem.items[index]),
      backgroundColor: context.surfaceContainer,
      trailing: Padding(
        padding: const EdgeInsets.all(16),
        child: action,
      ),
      extended: extended,
      labelType: extended ? null : NavigationRailLabelType.all,
      minWidth: 110,
      minExtendedWidth: 220,
    );
  }
}
