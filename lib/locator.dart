import 'package:get_it/get_it.dart';
import 'package:notes/get_it/api_manager.dart';
import 'package:notes/services/note_services.dart';

final locator = GetIt.I;

setup() {
  locator.registerLazySingleton<ApiManager>(() => ApiManager());
  locator.registerLazySingleton<NoteServices>(() => NoteServices());
}
