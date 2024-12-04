import 'package:core/feature/absence/absence.dart';
import 'package:core/tab/tab.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();

  static String get initial => TabPage.route();

  static List<GoRoute> list() => [
        GoRoute(
          path: TabPage.path(),
          builder: (_, state) => TabPage(
            key: state.pageKey,
            page: state.pathParameters['page']!,
          ),
          routes: [
            GoRoute(
              path: AbsenceDetailPage.subroute(),
              pageBuilder: (_, state) => AbsenceDetailPage(
                id: state.uri.queryParameters['id'],
              ),
            ),
          ],
        ),
      ];
}
