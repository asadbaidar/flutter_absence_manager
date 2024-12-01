import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:locale/locale.dart';

class TabState extends Equatable {
  const TabState({
    required this.currentTab,
  });

  final TabItem currentTab;

  @override
  List<Object> get props => [currentTab];

  int get currentTabIndex => TabItem.items.indexOf(currentTab);
}

enum TabItem {
  absence(AssetIcons.home),
  blank(AssetIcons.blank),
  employee(AssetIcons.hub),
  ;

  const TabItem(this.icon);

  factory TabItem.fromName(String? name) => name?.notBlank == null
      ? absence
      : items.firstWhereOrNull((e) => e.name == name) ?? absence;

  final AssetIcons icon;

  static const List<TabItem> items = [
    absence,
    // blank,
    employee,
  ];
}

extension TabItemHelper on TabItem {
  String get title {
    switch (this) {
      case TabItem.absence:
        return LocaleStrings.absences;
      case TabItem.employee:
        return LocaleStrings.employees;
      default:
        return '';
    }
  }

  String get path => 'tab/$name';

  int get $index => TabItem.items.indexOf(this);
}
