import 'package:my_chat_gpt/chat_page/data/models/chat_model.dart';

abstract class GetApiResponseDataSource {
  Future<ChatModel> getApiResponse(ChatModel chat);
}
