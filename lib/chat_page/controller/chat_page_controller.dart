import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';

import '../domain/use_cases/get_api_response_use_case.dart';
import '../domain/use_cases/update_chat_use_case.dart';

class ChatPageController extends GetxController {
  final RxBool isSendingMessage = false.obs;
  final TextEditingController messageController = TextEditingController();
  final RxList<ChatEntity> chatHistory = <ChatEntity>[].obs;
  ChatEntity? chatEntity;

  @override
  void onInit() {
    super.onInit();
    getArgs();
  }

  getArgs() async {
    final Map<String, dynamic>? args = Get.arguments;
    chatEntity = args!['chat'];
    if (chatEntity!.message.isNotEmpty) {
      sendMessage(chatEntity!.message);
    }
  }

  Future<void> sendMessage(String message) async {
    ChatEntity chat = ChatEntity(
      id: chatEntity!.id,
      message: message,
      role: 'user',
      typeAssistant: chatEntity!.typeAssistant,
      time: DateTime.now(),
    );
    chatHistory.add(chat);
    await updateHistory(chat);
    isSendingMessage.value = true;
    GetApiResponseUseCase getApiResponseUseCase = Get.find();
    final response = await getApiResponseUseCase.call(chat);
    response.fold((l) {
      Get.snackbar('Error', l.message!);
      isSendingMessage.value = false;
    }, (r) {
      chatHistory.add(r);
      isSendingMessage.value = false;
    });
  }

  Future<void> updateHistory(ChatEntity chat) async {
    UpdateChatUseCase updateChatUseCase = Get.find();
    final response = await updateChatUseCase.call(chat);
    response.fold((l) {
      Get.snackbar('Error', l.message!);
    }, (r) {});
  }
}
