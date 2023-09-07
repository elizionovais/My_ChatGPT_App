import 'package:dartz/dartz.dart';

import '../../../app/data/helpers/failures.dart';
import '../../../chat_page/domain/entities/chat_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, bool>> saveChat(ChatEntity chatEntity);
  Future<Either<Failure, bool>> deleteChat(ChatEntity chatEntity);
  Future<Either<Failure, List<ChatEntity>>> getChats();
}