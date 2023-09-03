import 'package:get/get.dart';

import '../controller/chat_page_controller.dart';
import '../data/data_source/get_api_response_data_source_impl.dart';
import '../data/repositories_impl/get_api_response_repository_impl.dart';
import '../domain/repositories/get_api_response_repository.dart';
import '../domain/use_cases/get_api_response_use_case.dart';

class ChatPageBinding extends Bindings {
  @override
  void dependencies() {
    final GetApiResponseRepository getApiResponseRepo = GetApiResponseRepositoryImpl(
      dataSource: GetApiResponseDataSourceImpl(),
    );

    Get.lazyPut<GetApiResponseUseCase>(
      () => GetApiResponseUseCase(repository: getApiResponseRepo),
      fenix: true,
    );

    Get.put<ChatPageController>(ChatPageController());
  }
}
