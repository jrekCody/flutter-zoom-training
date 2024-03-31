import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_zoom/di/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: 'initDi')
void configureInjection(String env) {
  getIt.initDi(environment: env);
}
