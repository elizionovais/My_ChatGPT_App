import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_gpt/app/data/helpers/use_case.dart';
import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';
import 'package:my_chat_gpt/historic_page/domain/use_cases/get_chats_use_case.dart';
import 'package:my_chat_gpt/historic_page/domain/use_cases/save_chat_use_case.dart';

import '../../app/routes/app_routes.dart';
import '../domain/use_cases/delete_chat_use_case.dart';

class HistoricPageController extends GetxController {
  final TextEditingController assistantController = TextEditingController();
  final RxList<ChatEntity> chats = <ChatEntity>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getChats();
  }

  goToNextPage(ChatEntity chatEntity) async {
    Get.toNamed(AppRoutes.CHAT, arguments: {
      'chat': chatEntity,
    });
  }

  Future<void> saveChat() async {
    final newChat =
        ChatEntity(message: '', role: 'user', time: DateTime.now(), typeAssistant: assistantController.text);

    SaveChatUseCase saveChatUseCase = Get.find();
    final result = await saveChatUseCase.call(newChat);
    result.fold((l) {
      Get.snackbar(
        'Error',
        l.message!,
      );
    }, (r) async {
      newChat.id = r;
      goToNextPage(newChat);
    });
  }

  Future<void> deleteChat(ChatEntity chat) async {
    DeleteChatUseCase deleteChatUseCase = Get.find();
    final result = await deleteChatUseCase.call(chat);

    result.fold((l) {
      Get.snackbar(
        'Error',
        l.message!,
      );
    }, (r) async {
      Get.snackbar(
        'Success',
        'Chat deleted',
      );
      chats.remove(chat);
    });
  }

  Future<void> getChats() async {
    isLoading.value = true;
    GetChatsUseCase sendContactUsUseCase = Get.find();
    final result = await sendContactUsUseCase.call(NoParams());
    result.fold((l) {
      Get.snackbar(
        'Error',
        l.message!,
      );
      isLoading.value = false;
    }, (r) async {
      chats.value = r;
      isLoading.value = false;
    });
  }
}
