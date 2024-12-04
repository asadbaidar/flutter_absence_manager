import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class AbsenceContent extends StatelessWidget {
  const AbsenceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitle(
      title: LocaleStrings.absences,
      child: const AbsenceFilterListener(
        child: _AbsenceBody(),
      ),
    );
  }
}

class _AbsenceBody extends StatelessWidget {
  const _AbsenceBody();

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((AbsenceBloc bloc) => bloc.state.dataState.isLoading);
    return Stack(
      children: [
        const AbsenceListView(),
        SmartLinearProgress.standard(visible: isLoading),
      ],
    );
  }
}
