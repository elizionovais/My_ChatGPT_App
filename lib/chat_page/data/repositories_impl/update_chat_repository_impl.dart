import 'package:dartz/dartz.dart';

import 'package:my_chat_gpt/app/data/helpers/failures.dart';

import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';

import '../../domain/repositories/update_chat_repository.dart';
import '../data_source/update_chat_data_source.dart';
import '../errors/execptions.dart';
import '../models/chat_model.dart';

class UpdateChatRepositoryImpl implements UpdateChatRepository {
  final UpdateChatDataSource dataSource;

  UpdateChatRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, bool>> updateChat(ChatEntity chatEntity) async{
    try {
      final result = await dataSource.updateChat(ChatModel.fromEntity(chatEntity));

      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(UpdateChatException('Error on update chat, verify your connection'));
    }
  }
}
