import 'package:get_it/get_it.dart';
import 'package:notes/get_it/api_manager.dart';

final locator = GetIt.I;

setup() {
  locator.registerSingleton<ApiManager>(ApiManager());
}
