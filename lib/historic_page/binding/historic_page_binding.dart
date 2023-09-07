import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../controller/historic_page_controller.dart';
import '../data/data_source/chat_data_source_impl.dart';
import '../data/repositories_impl/chat_repository_impl.dart';
import '../domain/use_cases/delete_chat_use_case.dart';
import '../domain/use_cases/get_chats_use_case.dart';
import '../domain/use_cases/save_chat_use_case.dart';

class HistoricPageBinding extends Bindings {
  @override
  void dependencies() {
    final chatRepo = ChatRepositoryImpl(dataSource: ChatDataSourceImpl(
      FirebaseFirestore.instance
    ));

    Get.lazyPut<GetChatsUseCase>(() => GetChatsUseCase(repository: chatRepo), fenix: true);
    Get.lazyPut<SaveChatUseCase>(() => SaveChatUseCase(repository: chatRepo), fenix: true);
    Get.lazyPut<DeleteChatUseCase>(() => DeleteChatUseCase(repository: chatRepo), fenix: true);

    Get.put<HistoricPageController>(HistoricPageController());
  }
}