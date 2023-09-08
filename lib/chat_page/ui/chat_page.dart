import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_gpt/chat_page/ui/components/chat_box.dart';

import '../controller/chat_page_controller.dart';
import 'components/chat_loading_indicator.dart';

class ChatPage extends GetView<ChatPageController> {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: Text(controller.chatEntity!.typeAssistant!),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.isSendingMessage.value
                    ? controller.chatHistory.length + 1
                    : controller.chatHistory.length,
                itemBuilder: (context, index) {
                  if (controller.isSendingMessage.value && index == controller.chatHistory.length) {
                    return const Align(
                      alignment: Alignment.centerLeft,
                      child: ChatLoadingIndicator(),
                    );
                  } else {
                    return ChatBox(
                        isUserMessage: controller.chatHistory[index].role == 'user',
                        chat: controller.chatHistory[index]);
                  }
                },
              );
            }),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ).copyWith(borderRadius: const BorderRadius.all(Radius.circular(40))),
            margin: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      controller: controller.messageController,
                      decoration: const InputDecoration(
                        hintText: 'Digite sua mensagem',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final message = controller.messageController.text;
                    if (message.isNotEmpty) {
                      controller.sendMessage(message);
                      controller.messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
