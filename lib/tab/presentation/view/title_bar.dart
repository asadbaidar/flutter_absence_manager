import 'package:common/common.dart';
import 'package:core/tab/tab.dart';

/// A widget that shows the title view, sync button, and the locale button.
class TitleBar extends CustomAppBar {
  const TitleBar({
    super.key,
  }) : super(
          customTitle: const TitleView(),
          actions: const [SyncButton(), LocaleButton()],
        );
}
