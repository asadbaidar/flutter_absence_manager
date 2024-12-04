import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';

/// A widget that shows a list of absences with pagination and filters.
class AbsenceListView extends StatelessWidget {
  const AbsenceListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      buildWhen: (previous, current) => previous.dataState != current.dataState,
      builder: (context, state) {
        final data = state.dataState;
        return SmartDataPagingListView.builder(
          physics: const ClampingScrollPhysics(),
          data: data,
          itemBuilder: (_, __, data) => _AbsenceTile(data: data!),
          divider: const Divider(),
          // Shows a floating header with title and filters.
          topSliverBuilder: (context) => [const _AbsenceHeader()],
          bottomSliverBuilder: (_) => [48.spaceY.sliverBox],
          // Shows error or empty message based on the current state.
          replace: data.isFailureOrEmpty,
          replacementBuilder: (_) => DataError(
            data: data,
            emptyMessage: LocaleStrings.noAbsenceFound,
            onRetry: context.read<AbsenceBloc>().getAbsences,
          ),
          // Shows a loading indicator at the bottom of the list only
          // when the next page is loading.
          pageLoadingBuilder: (_) => const SmartLinearProgress.standard(),
          // Shows a `show more` button at the bottom of the list only
          // when there is a next page to load.
          pageButtonBuilder: (_, load) => PagingButton(onPressed: load),
          // Shows an error message at the bottom of the list only
          // when the next page loading failed.
          pageFailureBuilder: (_, reload) => PageError(
            data: data,
            onRetry: reload,
          ),
          // In phones/tablets, automatically loads the next page when the end
          // of the list is reached. In desktops, it shows a `show more` button.
          pageWithScrolling: context.isPhoneOrTablet,
          // Requests a next page when the end of the list is reached.
          onPageChange: (page) => context
              .read<AbsenceBloc>()
              .getAbsences(page: page, loadingState: DataState.pageLoading),
        );
      },
    );
  }
}

class _AbsenceHeader extends StatelessWidget {
  const _AbsenceHeader();

  @override
  Widget build(BuildContext context) {
    return SmartSliverHeader(
      floating: context.isBelowSmallScreen,
      minExtent: kMinInteractiveDimension + 24,
      builder: (_, __, ___) => const AbsenceFilterBar(),
    );
  }
}

class _AbsenceTile extends StatelessWidget {
  const _AbsenceTile({
    required this.data,
  });

  final Absence data;

  @override
  Widget build(BuildContext context) {
    final employee = context.select(
      (EmployeeBloc bloc) => bloc.state.getEmployeeById(data.userId),
    );
    return CustomInkWell(
      onTap: () => context.go(
        AbsenceDetailPage.route(context.currentRoute, id: data.id),
      ),
      child: AbsenceTile(
        absence: data,
        employee: employee,
      ),
    );
  }
}
