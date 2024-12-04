import 'package:bloc_test/bloc_test.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  const initialTab = TabItem.absence;
  const newTab = TabItem.employee;

  late GoRouter router;

  setUp(() {
    router = MockGoRouter();
  });

  group('TabBloc', () {
    test('should be created with initial state', () {
      expect(
        TabBloc(
          initialTab: initialTab,
        ).state,
        const TabState(
          currentTab: initialTab,
        ),
      );
    });

    group('changeTab should emit', () {
      blocTest<TabBloc, TabState>(
        'the new tab when its different from the previous one',
        setUp: () {
          when(() => router.replace<void>(any())).thenAnswer((_) async {});
        },
        build: () => TabBloc(
          initialTab: initialTab,
        ),
        act: (cubit) => cubit.changeTab(newTab, router: router),
        expect: () => [
          const TabState(
            currentTab: newTab,
          ),
        ],
        verify: (cubit) {
          expect(cubit.state.currentTabIndex, newTab.index);
          verify(() => router.go(any())).called(1);
        },
      );

      blocTest<TabBloc, TabState>(
        'nothing when the tab is same as the previous one',
        setUp: () {
          when(() => router.replace<void>(any())).thenAnswer((_) async {});
        },
        build: () => TabBloc(
          initialTab: initialTab,
        ),
        act: (cubit) => cubit.changeTab(initialTab, router: router),
        expect: () => <TabState>[],
        verify: (_) {
          verifyNever(() => router.replace<void>(any()));
        },
      );
    });
  });
}
