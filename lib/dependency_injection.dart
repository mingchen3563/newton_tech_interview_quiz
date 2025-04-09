import 'package:get_it/get_it.dart';
import 'package:newton_tech_interview_quiz/data/remote_data_sources/remote_v3_data_source.dart';
import 'package:newton_tech_interview_quiz/data/repositories/spacex_repository_impl.dart';
import 'package:newton_tech_interview_quiz/domain/repositories/spacex_repository.dart';
import 'package:newton_tech_interview_quiz/services/api_service.dart';

class DependencyInjection {
  static void inject() {
    final getIt = GetIt.instance;
    final apiService = ApiService();
    getIt.registerLazySingleton<ApiService>(() => apiService);
    final remoteV3DataSource = RemoteV3DataSource(apiService: apiService);
    getIt.registerLazySingleton<RemoteV3DataSource>(() => remoteV3DataSource);
    final spaceXRepository =
        SpaceXRepositoryImpl(remoteV3DataSource: remoteV3DataSource);
    getIt.registerLazySingleton<SpaceXRepository>(() => spaceXRepository);
  }
}
