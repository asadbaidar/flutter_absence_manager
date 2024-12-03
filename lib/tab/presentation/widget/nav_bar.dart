import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';

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

class SideNavBar extends StatelessWidget {
  const SideNavBar({
    super.key,
    required this.currentTab,
    required this.onSelect,
    this.leading,
  });

  final TabItem currentTab;
  final OnValue<TabItem> onSelect;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final extended = context.isLargeScreen;
    return NavigationRail(
      selectedIndex: currentTab.$index,
      destinations: TabItem.items.map(SideNavItem.new).toList(),
      onDestinationSelected: (index) => onSelect(TabItem.items[index]),
      backgroundColor: context.surfaceContainer,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: leading,
      ),
      extended: extended,
      labelType: extended ? null : NavigationRailLabelType.all,
      minWidth: 110,
      minExtendedWidth: 220,
    );
  }
}
