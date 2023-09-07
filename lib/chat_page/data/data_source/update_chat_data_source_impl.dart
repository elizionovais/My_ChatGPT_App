import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_gpt/chat_page/data/data_source/update_chat_data_source.dart';
import 'package:my_chat_gpt/chat_page/data/errors/execptions.dart';
import 'package:my_chat_gpt/chat_page/data/models/chat_model.dart';

class UpdateChatDataSourceImpl implements UpdateChatDataSource {
  UpdateChatDataSourceImpl(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;

  @override
  Future<bool> updateChat(ChatModel chatModel) async {
    try{
      await firebaseFirestore.collection("/chats").doc(chatModel.id).update({
        "message": chatModel.message,
        "time": chatModel.time,
      });
      return true;
    } catch (e) {
      throw UpdateChatException(e.toString());
    }
  }

  

}
