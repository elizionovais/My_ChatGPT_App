import 'package:dartz/dartz.dart';
import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';

import '../../../app/data/helpers/failures.dart';

abstract class GetApiResponseRepository {
  Future<Either<Failure, ChatEntity>> getApiResponse(ChatEntity chat);
}