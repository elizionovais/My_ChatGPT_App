import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';

class HistoricCard extends StatelessWidget {
  const HistoricCard({
    super.key,
    required this.chatEntity,
    this.onTap,
    required this.onDelete,
  });

  final ChatEntity chatEntity;
  final VoidCallback? onTap;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border.fromBorderSide(
            BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatEntity.typeAssistant ?? 'Assistente util',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Last message: ${chatEntity.message}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    '${chatEntity.time.day}/${chatEntity.time.month}/${chatEntity.time.year} ${chatEntity.time.hour}:${chatEntity.time.minute}',
                    style: const TextStyle(fontSize: 15, color: Colors.orange),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                Get.defaultDialog(
                  title: 'Delete Chat',
                  content: const Text('Are you sure you want to delete this chat?'),
                  textConfirm: 'Delete',
                  textCancel: 'Cancel',
                  confirmTextColor: Colors.orange,
                  onConfirm: () {
                    Get.back();
                    onDelete();
                  },
                  onCancel: () {
                    Get.back();
                  },
                );
              },
              ),
          ],
        ),
      ),
    );
  }
}
