import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class AbsenceContent extends StatelessWidget {
  const AbsenceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitle(
      title: LocaleStrings.absences,
      child: const Scaffold(
        appBar: CustomAppBar(
          customTitle: TitleView(),
          actions: [LocaleButton()],
        ),
        body: _AbsenceBody(),
      ),
    );
  }
}

class _AbsenceBody extends StatelessWidget {
  const _AbsenceBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(LocaleStrings.absences),
    );
  }
}
