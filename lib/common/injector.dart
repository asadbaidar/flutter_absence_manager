import 'package:common/common.dart';
import 'package:core/common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

final injector = GetIt.instance;

Future<void> initialzeDependencies() async {
  injector
    // Network
    ..registerSingleton(Environment.current)
    ..registerLazySingleton<HttpClient>(
      () => HttpClientImpl(environment: injector()),
    )

    // Router
    ..registerLazySingleton<AppRouter>(AppRouter.new)

    // Employee
    ..registerLazySingleton<EmployeeRemoteDataSource>(
      () => EmployeeRemoteDataSourceImpl(httpClient: injector()),
    )
    ..registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(dataSource: injector()),
    )
    ..registerFactory<EmployeeBloc>(
      () => EmployeeBloc(employeeRepository: injector())..getEmployees(),
    )

    // Absence
    ..registerLazySingleton<AbsenceRemoteDataSource>(
      () => AbsenceRemoteDataSourceImpl(httpClient: injector()),
    )
    ..registerLazySingleton<AbsenceRepository>(
      () => AbsenceRepositoryImpl(dataSource: injector()),
    )
    ..registerFactory<AbsenceBloc>(
      () => AbsenceBloc(absenceRepository: injector())..getAbsences(),
    );
}

class BlocProviderGet<T extends StateStreamableSource<Object?>>
    extends SingleChildStatelessWidget {
  const BlocProviderGet({
    super.key,
    super.child,
    this.lazy = true,
  });

  final bool lazy;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider<T>(
      lazy: lazy,
      create: (context) => injector(),
      child: child,
    );
  }
}
