import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_gpt/chat_page/data/models/chat_model.dart';

import '../errors/exceptions.dart';
import 'chat_data_source.dart';

class ChatDataSourceImpl implements ChatDataSource {
  ChatDataSourceImpl(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;

  @override
  Future<bool> deleteChat(ChatModel chatModel) async {
    try {
      await firebaseFirestore.collection("/chats").doc(chatModel.id).delete();
      return true;
    } catch (e) {
      throw DeleteChatException(e.toString());
    }
  }

  @override
  Future<List<ChatModel>> getChats() async {
    try {
      QuerySnapshot querySnapshot = await firebaseFirestore.collection("/chats").get();
      List<ChatModel> chats = querySnapshot.docs.map((doc) {
        return ChatModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return chats;
    } catch (e) {
      throw GetChatsException(e.toString());
    }
  }

  @override
  Future<String> saveChat(ChatModel chatModel) async {
    try {
      CollectionReference collection = FirebaseFirestore.instance.collection('chats');
      DocumentReference novoDocumento = collection.doc();
      String novoDocumentoId = novoDocumento.id;
      chatModel.id = novoDocumentoId;
      await novoDocumento.set(chatModel.toJson());
      return novoDocumentoId;
    } catch (e) {
      throw SaveChatException(e.toString());
    }
  }
}
