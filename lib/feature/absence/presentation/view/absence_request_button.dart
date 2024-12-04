import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

/// A button to request absence.
class AbsenceRequestButton extends StatelessWidget {
  const AbsenceRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.isAboveLargeScreen
        ? FloatingActionButton.extended(
            onPressed: () {},
            label: Text(LocaleStrings.requestAbsence),
            icon: const Icon(Icons.add),
          )
        : FloatingActionButton(
            onPressed: () {},
            tooltip: LocaleStrings.requestAbsence,
            child: const Icon(Icons.add),
          );
  }
}
