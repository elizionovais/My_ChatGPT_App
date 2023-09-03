import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_chat_gpt/chat_page/data/models/chat_model.dart';

import '../errors/execptions.dart';
import 'get_api_response_data_source.dart';

class GetApiResponseDataSourceImpl implements GetApiResponseDataSource {
  static const apiKey = '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';
  static const endpoint = 'https://api.openai.com/v1/chat/completions';

  @override
  Future<ChatModel> getApiResponse(ChatModel chat) async {
    try {
      Dio dio = Dio();
      final response = await dio.post(
        endpoint,
        data: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {'role': 'system', 'content': 'Voce é um ${chat.typeAssistant}.'},
            {'role': 'user', 'content': chat.message}
          ],
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
        ),
      );

      final responseBody = response.data;
      final assistantResponse = responseBody['choices'][0]['message']['content'];

      return ChatModel(message: assistantResponse, role: 'assistant', time: DateTime.now());
    } catch (e) {
      throw GetApiResponseException(e.toString());
    }
  }
}
