import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:travisgen_client/di/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: 'initGetIt', asExtension: false)
Future<void> configureDependencies() => initGetIt(getIt);
