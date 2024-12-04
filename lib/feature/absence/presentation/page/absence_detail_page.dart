import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:flutter/material.dart';

class AbsenceDetailPage extends Page<void> {
  const AbsenceDetailPage({
    super.key,
    this.id,
  });

  final String? id;

  static String route(String from, {int? id}) => RouteUri.path(
        from,
        routes: [subroute()],
        query: {'id': id},
      );

  static String subroute() => 'detail';

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      settings: this,
      builder: (context) => AbsenceDetailContent(id: id),
    );
  }
}
