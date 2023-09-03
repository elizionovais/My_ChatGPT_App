import 'package:flutter/material.dart';
import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({
    super.key,
    required this.chat,
    this.isUserMessage = false,
  });
  final ChatEntity? chat;
  final bool isUserMessage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: isUserMessage
            ? const EdgeInsets.only(top: 5, left: 40, right: 10, bottom: 5)
            : const EdgeInsets.only(top: 5, left: 10, right: 40, bottom: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.cyan : Colors.orange,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              chat!.message,
              style: TextStyle(
                color: isUserMessage ? Colors.white : Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                '${chat!.time.hour}:${chat!.time.minute}',
                style: TextStyle(
                  color: isUserMessage ? Colors.white : Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
