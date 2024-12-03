import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends NavigationDestination {
  BottomNavItem(
    TabItem tab, {
    super.key,
  }) : super(
          icon: AssetIcon.monotone(tab.icon),
          label: tab.title,
        );
}

class SideNavItem extends NavigationRailDestination {
  SideNavItem(
    TabItem tab,
  ) : super(
          icon: AssetIcon.monotone(tab.icon),
          label: Text(tab.title),
        );
}
