import 'package:charity_game/data/projects/network/projects_rest_client.dart';
import 'package:charity_game/data/projects/projects_repository.dart';
import 'package:charity_game/data/themes/network/themes_rest_client.dart';
import 'package:charity_game/data/themes/themes_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt sl = new GetIt();

void setupServiceLocator() {
  sl.registerLazySingleton<http.Client>(() => http.Client());
  _registerRepositories();
}

void _registerRepositories() {
  sl.registerLazySingleton<ProjectsRepository>(() {
    return ProjectsRepository(
        restClient: ProjectsRestClient(sl.get<http.Client>()));
  });
  sl.registerLazySingleton<ThemesRepository>(() {
    return ThemesRepository(
        restClient: ThemesRestClient(sl.get<http.Client>()));
  });
}