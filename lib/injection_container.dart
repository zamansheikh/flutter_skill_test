import 'package:flutter_skill_test/features/home/data/datasources/home_fake_remote_datasource.dart';
import 'package:flutter_skill_test/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_skill_test/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_skill_test/features/home/domain/usecases/fetch_all_houses_usecase.dart';
import 'package:flutter_skill_test/features/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Injection {
  static void init() {
    // External
    Get.lazyPut(() => http.Client());

    // Data Source
    Get.lazyPut<HomeFakeRemoteDatasource>(() => HomeFakeRemoteDatasourceImpl(client: Get.find()));

    // Repository
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(datasource: Get.find()));

    // Use Case
    Get.lazyPut(() => FetchAllHousesUsecase(repository: Get.find()));

    // Controller
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
