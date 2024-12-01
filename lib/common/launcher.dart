import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/app/app.dart';
import 'package:core/common/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locale/locale.dart';

Future<void> launcher(Callback<FutureOr<void>> config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheStorage.initialize();
  CachedBloc.initialize();

  await EasyLocalization.ensureInitialized();

  await preloadImage(AssetImages.logo());
  await config();
  await initialzeDependencies();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = AppBlocObserver();

  runApp(const App());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (Environment.current.isDev) {
      bloc.$debugPrint(change.runtimeType, tag: 'bloc.change');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    bloc.$debugPrint('($error, $stackTrace)', tag: 'bloc.error');
    super.onError(bloc, error, stackTrace);
  }
}
