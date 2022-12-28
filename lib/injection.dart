

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {

  // external
  locator.registerLazySingleton(() => http.Client());
}
