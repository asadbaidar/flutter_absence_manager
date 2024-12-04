import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

/// Absence action buttons to confirm or reject the request.
class AbsenceActionButtons extends StatelessWidget {
  const AbsenceActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final smallScreen = context.isBelowSmallScreen;
    return BottomView(
      direction: smallScreen ? Axis.vertical : Axis.horizontal,
      children: [
        CustomElevatedButton(
          text: LocaleStrings.confirm,
          onPressed: () {},
          width: smallScreen ? double.infinity : 100,
        ),
        const SizedBox.square(dimension: 16),
        CustomOutlinedButton(
          text: LocaleStrings.reject,
          onPressed: () {},
          width: smallScreen ? double.infinity : 100,
        ),
      ],
    );
  }
}
