import 'package:core/feature/absence/absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

/// A listener that listens to the [AbsenceBloc] state changes and triggers
/// [AbsenceBloc.getAbsences] when the selected `type` or `date` changes.
/// 
/// It should be placed as above as possible in the widget tree to ensure
/// that it always listens to the state changes.
class AbsenceFilterListener extends SingleChildStatelessWidget {
  const AbsenceFilterListener({
    super.key,
    super.child,
  });

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<AbsenceBloc, AbsenceState>(
      listenWhen: (previous, current) =>
          previous.selectedType != current.selectedType ||
          previous.selectedDate != current.selectedDate,
      listener: (context, state) {
        context.read<AbsenceBloc>().getAbsences();
      },
      child: child,
    );
  }
}
