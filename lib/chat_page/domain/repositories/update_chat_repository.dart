import 'package:dartz/dartz.dart';

import '../../../app/data/helpers/failures.dart';
import '../entities/chat_entity.dart';

abstract class UpdateChatRepository {
  Future<Either<Failure, bool>> updateChat(ChatEntity chatEntity);
}