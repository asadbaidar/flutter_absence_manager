import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

/// A title view with the app logo and the current date.
class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: LocaleStrings.appName,
      titleStyle: context.logo,
      titleMaxLines: 1,
      customSubtitle: Text(
        DateFormat.yMMMMEEEEd(context.locale.toString()).format(DateTime.now()),
      ),
    );
  }
}
