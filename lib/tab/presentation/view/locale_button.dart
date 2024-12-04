import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

/// A button to change the locale of the app.
class LocaleButton extends StatelessWidget {
  const LocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LifecycleObserver(
      onInit: () => context.updateLocale(),
      child: CustomActionButton(
        text: context.locale == LocaleConstants.deDE ? 'English' : 'Deutsch',
        onPressed: () {
          final upComingLocale = context.locale == LocaleConstants.deDE
              ? LocaleConstants.enUS
              : LocaleConstants.deDE;
          context.updateLocale(upComingLocale);
        },
      ),
    );
  }
}
