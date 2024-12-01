import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/widgets.dart';

class AbsencePage extends StatelessWidget {
  const AbsencePage({super.key});

  static String route() => RouteUri.tab(subroute());

  static String subroute() => TabItem.absence.name;

  @override
  Widget build(BuildContext context) {
    return const AbsenceContent();
  }
}
