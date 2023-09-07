import '../models/chat_model.dart';

abstract class UpdateChatDataSource {
  Future<bool> updateChat(ChatModel chatModel);
}