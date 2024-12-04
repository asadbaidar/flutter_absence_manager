import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';

/// Navigation item for bottom navigation bar
class BottomNavItem extends NavigationDestination {
  BottomNavItem(
    TabItem tab, {
    super.key,
  }) : super(
          icon: AssetIcon.monotone(tab.icon),
          label: tab.title,
        );
}

/// Navigation item for side navigation bar
class SideNavItem extends NavigationRailDestination {
  SideNavItem(
    TabItem tab,
  ) : super(
          icon: AssetIcon.monotone(tab.icon),
          label: Text(tab.title),
        );
}
