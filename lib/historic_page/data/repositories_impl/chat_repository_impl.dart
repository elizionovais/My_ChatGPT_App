import 'package:dartz/dartz.dart';

import 'package:my_chat_gpt/app/data/helpers/failures.dart';

import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';

import '../../../chat_page/data/models/chat_model.dart';
import '../../domain/repositories/chat_repository.dart';
import '../data_source/chat_data_source.dart';
import '../errors/exceptions.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource dataSource;

  ChatRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, bool>> deleteChat(ChatEntity chatEntity) async{
    try {
      final result = await dataSource.deleteChat(ChatModel.fromEntity(chatEntity));

      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(DeleteChatException('Error on delete chat'));
    }
  }

  @override
  Future<Either<Failure, List<ChatEntity>>> getChats() async{
    try {
      final result = await dataSource.getChats();

      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(GetChatsException('Error on get chats'));
    }
  }

  @override
  Future<Either<Failure, bool>> saveChat(ChatEntity chatEntity) async{
    try {
      final result = await dataSource.saveChat(ChatModel.fromEntity(chatEntity));

      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(SaveChatException('Error on save chat'));
    }
  }

  
}