import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';

import '../domain/use_cases/get_api_response_use_case.dart';

class ChatPageController extends GetxController {
  final RxBool isSendingMessage = false.obs;
  final TextEditingController messageController = TextEditingController();
  final RxList<ChatEntity> chatHistory = <ChatEntity>[].obs;
  String typeAssistant = 'Assistente util';

  Future<void> sendMessage(String message) async {
    ChatEntity chat = ChatEntity(
      message: message,
      role: 'user',
      typeAssistant: typeAssistant,
      time: DateTime.now(),
    );
    chatHistory.add(chat);
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

}
