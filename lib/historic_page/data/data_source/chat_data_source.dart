import '../../../chat_page/data/models/chat_model.dart';

abstract class ChatDataSource {
  Future<String> saveChat(ChatModel chatModel);
  Future<List<ChatModel>> getChats();
  Future<bool> deleteChat(ChatModel chatModel);
}
