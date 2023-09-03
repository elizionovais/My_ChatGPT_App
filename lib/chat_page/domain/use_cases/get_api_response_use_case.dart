import 'package:dartz/dartz.dart';
import 'package:my_chat_gpt/chat_page/domain/entities/chat_entity.dart';

import '../../../app/data/helpers/failures.dart';
import '../../../app/data/helpers/use_case.dart';
import '../repositories/get_api_response_repository.dart';

class GetApiResponseUseCase extends UseCase<ChatEntity, ChatEntity> {
  final GetApiResponseRepository repository;

  GetApiResponseUseCase({required this.repository});

  @override
  Future<Either<Failure, ChatEntity>> call(ChatEntity params) {
    return repository.getApiResponse(
      params
    );
  }
}