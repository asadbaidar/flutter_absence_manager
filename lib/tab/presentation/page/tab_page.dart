import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A root page that displays the tabs and their containers.
class TabPage extends StatelessWidget {
  const TabPage({
    super.key,
    required this.page,
  });

  final String page;

  static String path() => '/tab/:page';

  static String route([TabItem? tab]) => RouteUri.tab(tab?.name ?? _firstTab);

  static String get _firstTab => TabItem.items.first.name;

  TabItem get _tab => TabItem.fromName(page);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBloc(initialTab: _tab),
      child: const TabContent(),
    );
  }
}

extension TabContext on BuildContext {
  /// Returns the current tab.
  TabItem get currentTab => read<TabBloc>().state.currentTab;

  /// Returns the new tab by extracting from the route path parameters.
  TabItem? get newTab => TabItem.fromName(routePathParameters['page']);
}
