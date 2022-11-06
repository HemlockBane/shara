import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'di.config.dart';

final locator = GetIt.instance;


@InjectableInit()
void configureDependencies(){
  $initGetIt(locator);
}