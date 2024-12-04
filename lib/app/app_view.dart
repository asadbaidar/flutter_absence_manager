import 'package:common/common.dart';
import 'package:core/common/injector.dart';
import 'package:core/core.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.unfocus(),
      child: const LocaleProvider(
        child: AppFeatureProviders(),
      ),
    );
  }
}

class AppFeatureProviders extends StatelessWidget {
  const AppFeatureProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        BlocProviderGet<EmployeeBloc>(lazy: false),
        BlocProviderGet<AbsenceBloc>(),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = injector<AppRouter>();
    return MaterialApp.router(
      onGenerateTitle: (context) => LocaleStrings.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: AppTheme.light().data(context),
      darkTheme: AppTheme.dark().data(context),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        data: context.mediaQuery.copyWith(
          textScaler: TextScaler.noScaling,
        ),
        child: child!,
      ),
    );
  }
}
